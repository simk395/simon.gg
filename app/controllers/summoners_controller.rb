class SummonersController < ApplicationController
    def index
        #login
    end

    def create

        @summoner = Summoner.new(summoner_name: summoner_params)
        profile = @summoner.league_profile
        if profile != 404
            @summoner.save
            session[:summoner_id] = Summoner.last.id

            redirect_to summoner_path
        else
            redirect_to new_summoner_path
        end
    end

    def new
        @summoner = Summoner.new
    end

    def show
      # byebug

      @summoner = Summoner.find(params['id'])
      @profile = @summoner.league_profile
      @matches = @summoner.recent_10_games
      

    end


    private
    def summoner_params
        # params.require(:summoner).require(:summoner_name, :password, :password_confirmation)
        params.require(:summoner).require(:summoner_name)
    end

end
