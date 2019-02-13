class GamesController < ApplicationController

  def single_game
      game = RestClient.get("https://na1.api.riotgames.com/lol/match/v4/matches/#{self.game}?api_key=#{self.key}")
      game = JSON.parse(game)
  end

  def create
    game = Game.create(game: game_id)
  end

  def show
    # @game = Game.find(params['id'])
    # @game = @game.single_game
  end
end
