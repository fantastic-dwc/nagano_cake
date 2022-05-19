class ShippingAddress < ApplicationRecord
  
  def address_display
  '〒' + postcode + ' ' + address + ' ' + name
  end

end
