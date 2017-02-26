class ReportsController < ApplicationController
  def index
    @search = EntriesSearch.new(params[:search])
    @entries = @search.scope
  end
end
