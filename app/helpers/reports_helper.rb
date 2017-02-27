module ReportsHelper
  def amount_by_category(entries)
    results = Hash.new(0)

    entries.each do |entry|
      category = Category.find_by_id(entry[:category_id])
      if results[category] == nil
       results[category] = entry[:amount]
      else
       results[category] += entry[:amount]
     end
    end
    results
  end
end
