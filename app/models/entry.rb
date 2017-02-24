class Entry < ApplicationRecord
  mount_uploader :receipt, ReceiptUploader
  belongs_to :user
  belongs_to :category
  validates :amount, presence: true
  validates :entry_type, presence: true
  validates :category_id, presence: true
end
