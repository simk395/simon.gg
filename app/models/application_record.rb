require 'rest-client'

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

def key
<<<<<<< HEAD
  "RGAPI-03c8d3fc-ae4b-4b66-bcb4-4b5d78759d14"
end

def get_profile
  RestClient.get("https://na1.api.riotgames.com/lol/summoner/v4/summoners/by-name/#{self.summoner_name}?api_key=#{self.key}")
=======
  "RGAPI-7a99712b-658e-4c95-88bd-ad7cee2e2a45"
>>>>>>> c99cf2eb7761dadb415e0f59cf9b0d1d64bd72ef
end

# def single_game
#   games = RestClient.get("https://na1.api.riotgames.com/lol/match/v4/matches/#{game_id}?api_key=#{api_key_master}")
#   games_parsed = JSON.parse(games)
#   #binding.pry
# end

end
