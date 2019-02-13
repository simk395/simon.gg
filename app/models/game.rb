class Game < ApplicationRecord
    has_many :match_histories
    has_many :summoners, through: :match_histories

    #GIVES ARRAY OF HASHES
    def recent_10_games(account_id, api_key_master)
        client = RestClient.get("https://na1.api.riotgames.com/lol/match/v4/matchlists/by-account/#{account_id}?endIndex=10&beginIndex=0&api_key=#{api_key_master}")
        client_parsed = JSON.parse(client)
    end

    def single_game
        game = RestClient.get("https://na1.api.riotgames.com/lol/match/v4/matches/#{self.game}?api_key=#{self.key}")
        game = JSON.parse(game)
    end

    def find_champ(game_id)
        game = self.single_game
        players = {}
        game["participants"].map do |hash|
            players[hash["participantId"]] = hash["championId"]
        end
    end
end
