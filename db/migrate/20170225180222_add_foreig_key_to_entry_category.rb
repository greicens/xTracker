class AddForeigKeyToEntryCategory < ActiveRecord::Migration[5.0]
  def change
    add_reference :entries, :category, index: true, foreign_key: true
  end
end
