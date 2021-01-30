class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :customer
  validates :comment, presence: true
  validates :rate, presence: true
end
