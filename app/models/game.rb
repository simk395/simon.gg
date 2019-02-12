class Game < ApplicationRecord
    has_many :match_histories
    has_many :summoners, through: :match_histories

    #GIVES ARRAY OF HASHES
    def recent_10_games(account_id, api_key_master)
        client = RestClient.get("https://na1.api.riotgames.com/lol/match/v4/matchlists/by-account/#{account_id}?endIndex=10&beginIndex=0&api_key=#{api_key_master}")
        client_parsed = JSON.parse(client)
    end
end
