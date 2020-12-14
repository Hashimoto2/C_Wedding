class Article < ApplicationRecord
  attachment :image
  has_many :comments, dependent: :destroy
end
