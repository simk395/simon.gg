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
          players[hash["participantId"]] = hash["championId"].to_s
      end
  end

  def champ_name
      champ_names = []
      keys = self.find_champ(self.game)
      keys.each do |number|
          self.champions.each do |names|
              if names.include?(number)
                  champ_names << names[1]
              end
          end
      end
      champ_names
  end


  def get_summoners
    players_names = []
    self.single_game["participantIdentities"].map do |player|
      players_names << player["player"]["summonerName"]
    end
    players_names
  end

  def get_players_stats(players_name, index)
    stats_arr = []
    self.single_game["participants"].each do |player|
      players_hash = {}
      players_hash["name"] = players_name[index]
      players_hash["rank"] = player['highestAchievedSeasonTier']
      players_hash["team"] = player["teamId"]
      players_hash["damage"] = player["stats"]["totalDamageDealtToChampions"]
      players_hash["kills"] = player["stats"]["kills"]
      players_hash["deaths"] = player["stats"]["deaths"]
      players_hash["assists"] = player["stats"]["assists"]
      index = index + 1
      stats_arr << players_hash
    end
    stats_arr
  end



  # def stats(i)
  #   content_tag(:p, class: "game-player-stat"),"Damage:", @stats_arr[i]["damage"]
  #   content_tag(:p, class: "game-player-stat"),"Kills:", @stats_arr[i]["kills"]
  #   content_tag(:p, class: "game-player-stat"),"Deaths",
  #   content_tag(:p, class: "game-player-stat")
  #
  # end
end
