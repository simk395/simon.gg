class ChangeIntegerLimitInGames < ActiveRecord::Migration[5.2]
  def change
    change_column :games, :game, :integer, limit: 8
  end
end
