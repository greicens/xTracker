module EntriesSearchHelper
  class EntriesSearch
    attr_reader :date_from, :date_to, :category

    def initialize(params)
      params ||= {}

      @date_from = parsed_date(params[:date_from], 7.days.ago.to_date.to_s)
      @date_to = parsed_date(params[:date_to], Date.today.to_s)
      @category = Category.find_by_name(params[:category])
    end

    def scope(user_id)
      # using sql methods here user a filter that prevents users to send malicius queries do the database
      if @category.nil?
        Entry.where('day BETWEEN ? AND ?', @date_from, @date_to)
             .where(user_id: user_id)
      else

      Entry.where('day BETWEEN ? AND ?', @date_from, @date_to)
           .where(user_id: user_id)
           .where(category_id: @category.id)
      end

    end

    private

    def parsed_date(date_string, default)
      Date.parse(date_string)
    rescue ArgumentError, TypeError
      default
    end
  end
end
