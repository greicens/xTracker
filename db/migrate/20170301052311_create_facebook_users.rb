class CreateFacebookUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :facebook_users do |t|
      t.string :provider, null: false
      t.string :uid, null: false
      t.string :name
      t.string :location
      t.string :image_url
      t.string :url

      t.timestamps
    end
  end
end
