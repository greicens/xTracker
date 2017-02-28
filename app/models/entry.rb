class Entry < ApplicationRecord
  mount_uploader :receipt, ReceiptUploader
  belongs_to :user
  belongs_to :category, optional: true
  validates :amount, presence: true
  validates :entry_type, presence: true
  validates :category_id, presence: true

  def self.search(search)
    where("entry_type ILIKE ?", "%#{search}%")
  end
end
