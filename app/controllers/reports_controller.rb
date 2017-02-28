class ReportsController < ApplicationController
  def index
    @search = EntriesSearch.new(params[:search])
    @entries = @search.scope
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "report_pdf.html.erb",   # Excluding ".pdf" extension.
        template: "reports/report"
      end
    end
  end

end
