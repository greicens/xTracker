class WelcomeController < ApplicationController
  def index
    @entries = Entry.all
  end
  def new
    @entries = Entry.all
  end
end
