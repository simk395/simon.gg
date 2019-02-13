class Summoner < ApplicationRecord
    has_many :match_histories
    has_many :games, through: :match_histories
    # has_secure_password
    #grabs player profile
    # def league_profile
    #     profile = RestClient.get("https://na1.api.riotgames.com/lol/summoner/v4/summoners/by-name/#{self.summoner_name}?api_key=#{self.key}")
    #     @profile = JSON.parse(profile)
    # end

        @@champ_ids = {"266" => "Aatrox", "103" => "Ahri","84"=>"Akali","12"=>"Alistar","32"=>"Amumu",
        "34"=>"Anivia","1"=>"Annie","22"=>"Ashe","136"=>"Aurelion Sol","268"=>"Azir",
        "432"=>"Bard","53"=>"Blitzcrank","63"=>"Brand","201"=>"Braum","51"=>"Caitlyn",
         "164"=>"Camille","69"=>"Cassiopeia","31"=>"Cho'Gath","42"=>"Corki","122"=>"Darius",
         "131"=>"Diana","119"=>"Draven","36"=>"Dr. Mundo","245"=>"Ekko","60"=>"Elise",
         "28"=>"Evelynn","81"=>"Ezreal","9"=>"Fiddlesticks","114"=>"Fiora","105"=>"Fizz",
         "3"=>"Galio","41"=>"Gangplank","86"=>"Garen","150"=>"Gnar","79"=>"Gragas",
         "104"=>"Graves","120"=>"Hecarim","74"=>"Heimerdinger","420"=>"Illaoi","39"=>"Irelia",
         "427"=>"Ivern","40"=>"Janna","59"=>"Jarvan IV","24"=>"Jax","126"=>"Jayce",
         "202"=>"Jhin","222"=>"Jinx","145"=>"Kai'Sa","429"=>"Kalista","43"=>"Karma",
         "30"=>"Karthus","38"=>"Kassadin","55"=>"Katarina","10"=>"Kayle","141"=>"Kayn",
         "85"=>"Kennen","121"=>"Kha'Zix","203"=>"Kindred","240"=>"Kled","96"=>"Kog'Maw",
         "7"=>"LeBlanc","64"=>"Lee Sin","89"=>"Leona","127"=>"Lissandra","236"=>"Lucian",
         "117"=>"Lulu","99"=>"Lux","54"=>"Malphite","90"=>"Malzahar","57"=>"Maokai",
         "11"=>"Master Yi","21"=>"Miss Fortune","62"=>"Wukong","82"=>"Mordekaiser",
         "25"=>"Morgana","267"=>"Nami","75"=>"Nasus","111"=>"Nautilus","518"=>"Neeko",
         "76"=>"Nidalee","56"=>"Nocturne","20"=>"Nunu","2"=>"Olaf","61"=>"Orianna",
         "516"=>"Ornn","80"=>"Pantheon","78"=>"Poppy","555"=>"Pyke","133"=>"Quinn",
         "497"=>"Rakan","33"=>"Rammus","421"=>"Rek'Sai","58"=>"Renekton","107"=>"Rengar",
         "92"=>"Riven","68"=>"Rumble","13"=>"Ryze","113"=>"Sejuani","35"=>"Shaco",
         "98"=>"Shen","102"=>"Shyvana","27"=>"Singed","14"=>"Sion","15"=>"Sivir",
         "72"=>"Skarner","37"=>"Sona","16"=>"Soraka","50"=>"Swain","517"=>"Sylas",
         "134"=>"Syndra","223"=>"Tahm Kench","163"=>"Taliyah","91"=>"Talon","44"=>"Taric",
         "17"=>"Teemo","412"=>"Thresh","18"=>"Tristana","48"=>"Trundle","23"=>"Tryndamere",
         "4"=>"Twisted Fate","29"=>"Twitch","77"=>"Udyr","6"=>"Urgot","110"=>"Varus",
         "67"=>"Vayne","45"=>"Veigar","161"=>"Vel'Koz","254"=>"Vi","112"=>"Viktor",
         "8"=>"Vladimir","106"=>"Volibear","19"=>"Warwick","498"=>"Xayah","101"=>"Xerath",
         "5"=>"Xin Zhao","157"=>"Yasuo","83"=>"Yorick","154"=>"Zac","238"=>"Zed",
         "115"=>"Ziggs","26"=>"Zilean","142"=>"Zoe", "143" => "Zyra"}

    def find_champ
        game = self.single_game
        players = {}
        game["participants"].map do |hash|
            players[hash["participantId"]] = hash["championId"]
        end
    end

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
       self.find_game_ids
        @game_ids.map do |id|
            matches = RestClient.get("https://na1.api.riotgames.com/lol/match/v4/matches/#{id}?api_key=#{self.key}")
            @matches = JSON.parse(matches)
         end
    end

    def single_game
        #remember to add param for method
        game_id = 2975777720
        game = RestClient.get("https://na1.api.riotgames.com/lol/match/v4/matches/#{game_id}?api_key=#{self.key}")
        game = JSON.parse(game)
    end

    #gives account id
    def acc_id
        @profile["accountId"]
    end

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

#click on game
#game create
#show game