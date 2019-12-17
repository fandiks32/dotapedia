require "test/unit"
require 'pp'
class DotapediaTest <  Test::Unit::TestCase
  require File.expand_path(File.dirname(__FILE__) + "/../lib/dotapedia")

  test 'teams' do
    dotapedia = Dotapedia.new
    all_teams = dotapedia.teams
    assert(all_teams.size > 0)
    
    team_liquid = dotapedia.teams(name: 'Team Liquid')[0]
    assert_equal team_liquid.name, 'Team Liquid'

    all_pro_players = dotapedia.pro_players
    assert(all_pro_players.size > 0)
  end

  #: TODO add test, pro_matches, heroes, distributions, live

  test 'pro_players' do
    d = Dotapedia.new
    all_pro_players = d.pro_players
    assert_not_empty(all_pro_players)
  end
  
end
