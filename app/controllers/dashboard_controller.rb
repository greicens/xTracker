class DashboardController < ApplicationController
  before_action :require_login

  def index
    @user = current_user
    @entries = @user.entries
    p "#{@entries} this is entries"
  end
end
