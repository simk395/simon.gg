class MatchHistory < ApplicationRecord
    belongs_to :game
    belongs_to :summoner
end
