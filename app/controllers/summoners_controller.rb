class SummonersController < ApplicationController
    def index
        #login
    end

    def create

        @summoner = Summoner.find_or_initialize_by(summoner_name: summoner_params)
        profile = @summoner.league_profile
        if profile != 404
            @summoner.acc_id = profile["accountId"]
            @summoner.save
            session[:summoner_id] = @summoner.id
            # redirect_to summoner_path(session[:summoner_id])
            redirect_to summoner_path(session[:summoner_id])
        else
            redirect_to new_summoner_path
        end
    end

    def new
      # if session[:summoner_id].nil?
         @summoner = Summoner.new
      #  else
        #  redirect_to new_summoner_path
      #  end
    end

    def edit
      @summoner = Summoner.find(params[:id])
    end

    def update
      @summoner = Summoner.find(params[:id])
      profile = @summoner.league_profile
      @summoner.acc_id = profile["accountId"]
      if profile != 404
          @summoner.update(summoner_name: summoner_params)
          session[:summoner_id] = Summoner.find(params[:id])
          session[:acc_id] = profile["accountId"]

          redirect_to summoner_path(session[:summoner_id])
      else
          redirect_to edit_summoner_path(@summoner)
      end
    end

    def show
      session[:summoner_id] = params['id']
      @summoner = Summoner.find(params['id'])
      @account = @summoner.league_profile
      @profile = @summoner.acc_id
      @matches = @summoner.recent_10_games
      byebug
      @game = Game.new
    end

    def find_game
        @game = Game.find_by(params["game"])
    end

    def destroy
      session.delete :summoner_id
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
