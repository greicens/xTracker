class RemovesColumnFromEntries < ActiveRecord::Migration[5.0]
  def change
    remove_column :entries, :category_id
  end
end
