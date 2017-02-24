class Category < ApplicationRecord
  validates :name, presence: true, length: { in: 1..20}
  has_many :entries
end
