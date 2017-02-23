class User < ApplicationRecord
  has_secure_password
  include UsersHelper
  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user.try(:authenticate, params[:password])
  end
end
