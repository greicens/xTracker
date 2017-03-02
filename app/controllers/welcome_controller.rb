class WelcomeController < ApplicationController
  def index
    @user = current_user
    @request = request.env['omniauth.auth']
    puts "#{request.env['omniauth.auth']} THIS IS THE OMNIAUTH INFO"
  end
end
