class CartProduct < ApplicationRecord
  belongs_to :product
  belongs_to :customer

  validates :quantity, presence: true


  def subtotal
    product.with_tax_price * quantity
  end

end
