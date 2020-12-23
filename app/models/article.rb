class Article < ApplicationRecord

  attachment :image
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :category
  belongs_to :customer

  def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
  end

  validates :title, presence: true
  validates :introduction, presence: true
  validates :image, presence: true
end
