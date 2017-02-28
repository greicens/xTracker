class Entry < ApplicationRecord
  mount_uploader :receipt, ReceiptUploader
  belongs_to :user
  belongs_to :category, optional: true
  validates :amount, presence: true
  validates :entry_type, presence: true
  validates :category_id, presence: true
  scope :category, -> (category_id){ where category_id: category_id }
  scope :vendor, -> (vendor) { where vendor: vendor}
  scope :entry_type, -> (entry_type) { where entry_type: entry_type}
  scope :payment_type, -> (payment_type) { where payment_type: payment_type}
  scope :between, -> (date_from, date_to) { where(day: date_from..date_to) }

end
