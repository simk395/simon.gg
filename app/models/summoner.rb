class Summoner < ApplicationRecord
    has_many :match_histories
    has_many :games, through: :match_histories
    #has_secure_password
    #grabs player profile
    # def league_profile
    #     profile = RestClient.get("https://na1.api.riotgames.com/lol/summoner/v4/summoners/by-name/#{self.summoner_name}?api_key=#{self.key}")
    #     @profile = JSON.parse(profile)
    # end

    def find_champ
        game = self.single_game
        players = {}
        game["participants"].map do |hash|
            players[hash["participantId"]] = hash["championId"]
        end
    end

    def league_profile
        self.summoner_name = self.summoner_name.gsub(/\s+/, "")
        statuscode = begin
                        profile = RestClient.get("https://na1.api.riotgames.com/lol/summoner/v4/summoners/by-name/#{self.summoner_name}?api_key=#{self.key}")
                    rescue => error
                        error.response
                    end
        return @profile = JSON.parse(profile) unless statuscode.code == 404
        return 404
    end
     #GIVES ARRAY OF HASHES
    def find_game_ids
        matches = RestClient.get("https://na1.api.riotgames.com/lol/match/v4/matchlists/by-account/#{self.acc_id}?endIndex=10&beginIndex=0&api_key=#{self.key}")
        @matches = JSON.parse(matches)
        @game_ids = @matches["matches"].map do |id|
            id["gameId"]
        end
    end

    def recent_10_games
       self.find_game_ids
        @game_ids.map do |id|
            matches = RestClient.get("https://na1.api.riotgames.com/lol/match/v4/matches/#{id}?api_key=#{self.key}")
            @matches = JSON.parse(matches)
         end
    end
    #gives account id

    def player_names
        var = self.recent_10_games
        var["participantIdentities"]["player"].each do |players|
            players["summonerName"]
        end
    end
=begin
participantId"=>1
"player"
"summonerName"
"accountId"
=end
    def game_ids
        @game_ids
    end

    def test
        self.league_profile
        self.find_game_ids
        self.recent_10_games
    end

    def make_games
        @game_ids.each do |game|
            Game.create(game: game)
        end
    end

end

#put name on nav bar
#get session[:id] to application html
#champ profile icons