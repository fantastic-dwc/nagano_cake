class ShippingAddress < ApplicationRecord
  belongs_to :customer
  def address_display
  '〒' + postcode + ' ' + address + ' ' + name
  end
validates :postcode, presence: true
validates :address, presence: true
validates :name, presence: true
end
