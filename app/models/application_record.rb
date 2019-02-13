require 'rest-client'

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

def key
  "RGAPI-03c8d3fc-ae4b-4b66-bcb4-4b5d78759d14"
end

# def get_profile
#   RestClient.get("https://na1.api.riotgames.com/lol/summoner/v4/summoners/by-name/#{self.summoner_name}?api_key=#{self.key}")
# end

def find_game_ids
  matches = RestClient.get("https://na1.api.riotgames.com/lol/match/v4/matchlists/by-account/#{self.acc_id}?endIndex=10&beginIndex=0&api_key=#{self.key}")
  @matches = JSON.parse(matches)
  @game_ids = @matches["matches"].map do |id|
      id["gameId"]
  end
end

# def single_game
#   games = RestClient.get("https://na1.api.riotgames.com/lol/match/v4/matches/#{game_id}?api_key=#{api_key_master}")
#   games_parsed = JSON.parse(games)
#   #binding.pry
# end

end
