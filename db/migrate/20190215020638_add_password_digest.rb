class AddPasswordDigest < ActiveRecord::Migration[5.2]
  def change
    add_column :summoners, :password_digest, :string
  end
end
