require 'rest-client'

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

def key
  "RGAPI-334d3bdd-cc8b-4100-9855-d5ca242ca373"
end

# def single_game
#   games = RestClient.get("https://na1.api.riotgames.com/lol/match/v4/matches/#{game_id}?api_key=#{api_key_master}")
#   games_parsed = JSON.parse(games)
#   #binding.pry
# end

end
