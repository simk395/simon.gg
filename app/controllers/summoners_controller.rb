class SummonersController < ApplicationController
    def index
        #login
    end

    def create

        @summoner = Summoner.new(summoner_name: summoner_params)
        profile = @summoner.league_profile
        if profile != 404
            @summoner.acc_id = profile["accountId"]
            @summoner.save
            session[:summoner_id] = Summoner.last.id
            redirect_to summoner_path(session[:summoner_id])
        else
            redirect_to new_summoner_path
        end
    end

    def new
      @summoner = Summoner.new
    end

    def edit
      @summoner = Summoner.find(params[:id])
    end

    def update
      @summoner = Summoner.find(params[:id])
      profile = @summoner.league_profile
      if profile != 404
          @summoner.update(summoner_name: summoner_params)
          session[:summoner_id] = Summoner.find(params[:id])

          redirect_to summoner_path(session[:summoner_id])
      else
          redirect_to edit_summoner_path(@summoner)
      end
    end

    def show
      session[:summoner_id] = params['id']
      @summoner = Summoner.find(params['id'])
      @profile = @summoner.acc_id
      @matches = @summoner.recent_10_games
      @game = Game.new
    end

    def find_game
        @game = Game.find_by(params["game"])
    end

    def destroy
      @summoner = Summoner.find(params['id'])
      @summoner.delete
      redirect_to new_summoner_path
    end

    private
    def summoner_params
        # params.require(:summoner).require(:summoner_name, :password, :password_confirmation)
        params.require(:summoner).require(:summoner_name)
    end

end
