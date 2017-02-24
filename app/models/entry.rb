class Entry < ApplicationRecord
  mount_uploader :receipt, ReceiptUploader
end
