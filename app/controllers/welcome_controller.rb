class WelcomeController < ApplicationController
  def index
  end
  def new
    @user = User.new
  end
end
