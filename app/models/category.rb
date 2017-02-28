class Category < ApplicationRecord
  validates :name, presence: true, length: { in: 1..20}
  validates_uniqueness_of :name
  has_many :entries
end
