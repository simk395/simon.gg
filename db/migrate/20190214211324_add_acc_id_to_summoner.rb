class AddAccIdToSummoner < ActiveRecord::Migration[5.2]
  def change
    add_column :summoners, :acc_id, :string 
  end
end
