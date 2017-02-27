class ReportsController < ApplicationController
  def index
    @search = EntriesSearch.new(params[:search])
    @entries = @search.scope(current_user.id)
  end

end
