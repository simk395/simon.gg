class GamesController < ApplicationController

  def single_game(game_id)
      game = RestClient.get("https://na1.api.riotgames.com/lol/match/v4/matches/#{game_id}?api_key=#{self.key}")
      game = JSON.parse(game)
  end


def show
  @game = Game.find(params['id'])
  @game = @game.single_game
  
end
end
