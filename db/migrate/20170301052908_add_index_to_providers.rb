class AddIndexToProviders < ActiveRecord::Migration[5.0]
  def change
    add_index :facebook_users, :provider
    add_index :facebook_users, :uid
    add_index :facebook_users, [:provider, :uid], unique: true
  end
end
