class Summoner < ApplicationRecord
    has_many :match_histories
    has_many :games, through: :match_histories
end
