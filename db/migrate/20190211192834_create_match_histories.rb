class CreateMatchHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :match_histories do |t|
      t.integer :game_id
      t.integer :account_id
      t.timestamps
    end
  end
end
