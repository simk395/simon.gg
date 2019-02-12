require 'rest-client'

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

def key
  "RGAPI-7a99712b-658e-4c95-88bd-ad7cee2e2a45"
end

# def single_game
#   games = RestClient.get("https://na1.api.riotgames.com/lol/match/v4/matches/#{game_id}?api_key=#{api_key_master}")
#   games_parsed = JSON.parse(games)
#   #binding.pry
# end

end
