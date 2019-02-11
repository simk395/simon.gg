class CreateMatchHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :match_histories do |t|

      t.timestamps
    end
  end
end
