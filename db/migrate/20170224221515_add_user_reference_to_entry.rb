class AddUserReferenceToEntry < ActiveRecord::Migration[5.0]
  def change
    add_reference :entries, :user, index: true, foreign_key: true
  end
end
