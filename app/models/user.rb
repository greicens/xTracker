class User < ApplicationRecord
  has_secure_password
  has_many :entries
  validates_uniqueness_of :username, :email
  user.url = auth_hash['info']['urls'][user.provider.capitalize]
  include UsersHelper
  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user.try(:authenticate, params[:password])
  end
end
