require 'rest-client'

require 'pry'

api_key_master = "RGAPI-334d3bdd-cc8b-4100-9855-d5ca242ca373"

    

    def recent_10_games(account_id, api_key_master)
        client = RestClient.get("https://na1.api.riotgames.com/lol/match/v4/matchlists/by-account/#{account_id}!!!?endIndex=10&beginIndex=0&api_key=#{api_key_master}")
        client_parsed = JSON.parse(client)
        binding.pry
    end
    account = data("joncher", api_key_master)
    account_id = account["accountId"]
    match_list = data2(account_id, api_key_master) 
    
    match_list.each do |match|
        match["gameId"]
    end
