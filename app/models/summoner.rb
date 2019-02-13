class Summoner < ApplicationRecord
    has_many :match_histories
    has_many :games, through: :match_histories
    # has_secure_password
    #grabs player profile

    def league_profile
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

        self.find_game_ids.map do |id|
            Game.create(game: id)
            matches = RestClient.get("https://na1.api.riotgames.com/lol/match/v4/matches/#{id}?api_key=#{self.key}")
            @matches = JSON.parse(matches)
        end
        return @matches
    end

    def single_game(game_id)
        game = RestClient.get("https://na1.api.riotgames.com/lol/match/v4/matches/#{game_id}?api_key=#{self.key}")
        game = JSON.parse(game)
    end

    #gives account id
    def acc_id
        @profile["accountId"]
    end

    def game_ids
        @game_ids
    end

    def test
        self.league_profile
        self.find_game_ids
        self.recent_10_games
    end
end
