class Message < ApplicationRecord
  validates :content, presence: true, length: { maximum: 50 }
  belongs_to :user
  belongs_to :article
end
