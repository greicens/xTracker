class WelcomeController < ApplicationController
  def index
    @latest_entries = latest_entries
  end
  def new
    @entry = Entry.new
  end
end
