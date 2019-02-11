require 'rest-client'
require 'lol'
require 'pry'



    def data(summoner_name)
        client = RestClient.get("https://na1.api.riotgames.com/lol/summoner/v4/summoners/by-name/#{summoner_name}?api_key=RGAPI-334d3bdd-cc8b-4100-9855-d5ca242ca373")
        client_parsed = JSON.parse(client)
        # binding.pry
    end

    def data2
        lolclient = Lol::Client.new "RGAPI-334d3bdd-cc8b-4100-9855-d5ca242ca373", region: "na"
        binding.pry
    end
    data("joncher")
    data2