class CartProduct < ApplicationRecord
  belongs_to :product
  belongs_to :customer

  validates :quantity, presence: true

end
