class WelcomeController < ApplicationController
  
  def new
    @entry = Entry.new
  end
end
