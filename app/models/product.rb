class Product < ApplicationRecord
  belongs_to :genre
  has_many :cart_products, dependent: :destroy
  has_many :order_products, dependent: :destroy


  has_one_attached :product_image

  def get_product_image
    (product_image.attached?) ? product_image : '124196m.jpg'
  end

  def with_tax_price
     (price * 1.1).floor
  end

  def self.search_for(content)
      Product.where('name LIKE?', '%' + content + '%')
  end

  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :product_image, presence: true

end
