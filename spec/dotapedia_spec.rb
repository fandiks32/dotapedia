require 'spec_helper'

RSpec.describe Dotapedia, "#teams" do
  it "Team is exist" do
    dotapedia = Dotapedia.new
    expect(dotapedia.teams.size).to be > 0
  end

  it "Team Liquid is exist" do
    dotapedia = Dotapedia.new
    team_liquid = dotapedia.teams(name: 'Team Liquid')[0]
    expect(team_liquid.name).to eq 'Team Liquid'
  end
end


RSpec.describe Dotapedia, "#proPlayers" do
  it "ProPlayer is exist" do
    dotapedia = Dotapedia.new
    expect(dotapedia.pro_players.size).to be > 0
  end

  it "Miracle- is existed" do
    dotapedia = Dotapedia.new
    player = dotapedia.pro_players(name: 'Miracle-')[0]
    expect(player.name).to eq 'Miracle-'
  end
end
