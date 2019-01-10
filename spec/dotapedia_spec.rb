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

RSpec.describe Dotapedia, "#proMatches" do
  it "ProMatches is exist" do
    dotapedia = Dotapedia.new
    expect(dotapedia.pro_matches.size).to be > 0
  end
end

RSpec.describe Dotapedia, "#heroes" do
  it "Heroes is exist" do
    dotapedia = Dotapedia.new
    expect(dotapedia.heroes.size).to be > 0
  end

  it "Axe is existed" do
    dotapedia = Dotapedia.new
    player = dotapedia.heroes(localized_name: 'Anti-Mage', name: 'npc_dota_hero_antimage')[0]
    expect(player.localized_name).to eq 'Anti-Mage'
  end
end

RSpec.describe Dotapedia, "#distributions" do
  it "Distributions(MMR) is existed" do
    dotapedia = Dotapedia.new
    expect(dotapedia.heroes.size).to be > 0
  end
end

RSpec.describe Dotapedia, "#live" do
  it "live is exist" do
    dotapedia = Dotapedia.new
    expect(dotapedia.live.size).to be > 0
  end
end
