class RenameAccountIdToSummonerId < ActiveRecord::Migration[5.2]
  def change
    rename_column :match_histories, :account_id, :summoner_id
  end
end
