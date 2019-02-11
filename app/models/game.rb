class Game < ApplicationRecord
    has_many :match_histories
    has_many :summoners, through: :match_histories
end
