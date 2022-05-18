class Product < ApplicationRecord
  belongs_to :genre
  has_many :cart_products, dependent: :destroy
  has_many :order_products, dependent: :destroy


  has_one_attached :product_image

  def get_product_image
    (product_image.attached?) ? product_image : 'no_image.jpg'
  end

  validates :name, presence: true
  validates :introduction, presence: true
  validates :genre_id, presence: true
  validates :price, presence: true

end
