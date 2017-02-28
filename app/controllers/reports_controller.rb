class ReportsController < ApplicationController
  def index
    category = Category.find_by_name(params[:category])
    @entries = current_user.entries.where(nil) #creates an anonymous scope
    @entries = @entries.category(category.id) if params[:category].present?
    @entries = @entries.vendor(params[:vendor]) if params[:vendor].present?
    @entries = @entries.entry_type(params[:entry_type]) if params[:entry_type].present?
    @entries = @entries.payment_type(params[:payment_type]) if params[:payment_type].present?
    @entries = @entries.between(params[:date_from], params[:date_to]) if params[:date_from].present? && params[:date_to].present?
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "report_pdf.html.erb",   # Excluding ".pdf" extension.
        template: "reports/report"
      end
    end
  end

end
