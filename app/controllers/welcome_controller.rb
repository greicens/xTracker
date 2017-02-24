class WelcomeController < ApplicationController
  def index
    @latest_entries = latest_entries
  end
  def new
    @entries = Entry.all
  end
end
