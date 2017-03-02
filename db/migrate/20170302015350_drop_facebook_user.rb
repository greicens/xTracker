class DropFacebookUser < ActiveRecord::Migration[5.0]
  def change
    drop_table :facebook_users
  end
end
