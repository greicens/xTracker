module EntriesHelper
  def latest_entries(entries)
    length = entries.count
    result = []
    i = 0
    while i < length && i < 4 do
      result << entries[i]
      i+=1
    end
     result
  end

  # def search
  #   @q = "%#{params[:query]}%"
  # end
end
