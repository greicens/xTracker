class User < ApplicationRecord
  has_secure_password
  has_many :entries
  has_many :authorizations
  validates_uniqueness_of :username, :email
  # user.url = auth_hash['info']['urls'][user.provider.capitalize]
  include UsersHelper
  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user.try(:authenticate, params[:password])
  end


  # def from_omniauth(auth_hash)
  #   user = find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'])
  #   user.name = auth_hash['info']['name']
  #   user.location = auth_hash['info']['location']
  #   user.image_url = auth_hash['info']['image']
  #   user.url = auth_hash['info']['urls']['Twitter']
  #   user.save!
  #   user
  # end
end
