class SummonersController < ApplicationController
    def index
        #login
    end

    def create
        @summoner = Summoner.new(summoner_params)
        if summoner.save
            redirect_to summoner_path
        else
            redirect_to new_summoner
        end
    end

    def new
        @summoner = Summoner.new
    end

    def show
        @summoner.find(params[:id])
    end

    def summoner_params
        params.require(:summoner).require(:summoner_name, :password, :password_confirmation)
    end
end