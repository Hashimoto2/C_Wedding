class Article < ApplicationRecord
  attachment :image
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :categorys
  def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
  end
end
