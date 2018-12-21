module DotaObject
  def self.define_struct(klass_name, keys)
    unless self.const_defined?(klass_name)
      klass = Struct.new(*keys)
      DotaObject.const_set(klass_name, klass)
    end
  end
end
