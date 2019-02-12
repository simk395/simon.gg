class CreateSummoners < ActiveRecord::Migration[5.2]
  def change
    create_table :summoners do |t|
      t.string :summoner_name
      t.timestamps
    end
  end
end
