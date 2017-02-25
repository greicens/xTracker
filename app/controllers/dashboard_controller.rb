class DashboardController < ApplicationController
  def index
    @latest_entries = latest_entries
  end
end
