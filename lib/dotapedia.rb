class Dotapedia
  require "net/http"
  require "json"
  require "active_record"
  require File.expand_path(File.dirname(__FILE__) + "/dota_object")

  def initialize(base_url: "https://api.opendota.com/api")
    @base_url = base_url
  end

  method_names = [
    :teams,
    :pro_players,
    :pro_matches,
    :heroes,
    :distributions,
    :live
  ].freeze
  
  method_names.each do |method_name|
    define_method method_name do |query = {}|
      endpoint = camelcase(method_name.to_s)
      request = api_request("/#{endpoint}")
      json_data = request[:json]
      struct_name = method_name.to_s.singularize.camelize
      create_dota_object_struct(struct_name, json_data[0].keys)
      result = create_struct(struct_name, json_data)
      filter_struct(result, query)
      result
    end
  end
  
  def request(url)
    api_request(url)
  end

  private

  def create_dota_object_struct(struct_name, keys)
    DotaObject.define_struct(struct_name, keys)
  end

  def create_struct(struct_name, json_data)
    object = DotaObject.const_get struct_name
    filtered_json = json_data
    filtered_json.map do |json|
      object.new(*json.values)
    end
  end
    
  def filter_struct(structs, query)
    query.each do |key, value|
      structs.reject! { |x| x.send(key) != value }
    end
    structs
  end
  
  def api_request(url)
    uri = URI.parse(@base_url + url)
    http = Net::HTTP.new(uri.host, uri.port)
    initheader = {'Content-Type' => 'application/json'}
    http.use_ssl = true if @base_url =~ /^https/
    request = Net::HTTP::Get.new(uri.path, initheader)
    response = http.request(request)
    if response.body
      begin
        {:status => response.code, :json => recursive_symbolize_keys(JSON.load(response.body))}
      rescue
        response.body
      end
    else
      response.code
    end
  end

  def recursive_symbolize_keys(data)
    case data
    when Hash
      Hash[
        data.map do |k, v|
          [ k.respond_to?(:to_sym) ? k.to_sym : k, recursive_symbolize_keys(v) ]
        end
      ]
    when Enumerable
      data.map { |v| recursive_symbolize_keys(v) }
    else
      data
    end
  end
  
  def camelcase(string)
    string = string.underscore.camelize
    string[0] = string[0].downcase
    string
  end
end
