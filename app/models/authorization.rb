class Authorization < ApplicationRecord
  belongs_to :user
  validates :provider, :uid, :presence => true
  # self.url = auth_hash['info']['urls'][user.provider.capitalize]
end
