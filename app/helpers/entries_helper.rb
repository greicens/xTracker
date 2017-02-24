module EntriesHelper
  def latest_entries
    entries = Entry.order(:created_at).reverse
    result = []
    
    for i in 0..3
      result << entries[i]
    end
     result
  end
end
