class OrderItem < ApplicationRecord
  belongs_to :instrument
  belongs_to :order

  after_create do
    if self.order.status == 'empty'
      self.order.update_attributes(status: 'cart')
    end
  end


  after_destroy do
    self.instrument.update_attributes!(status: 'active')
    if OrderItem.where(order_id: self.order_id).empty?
      self.order.update_attributes(status: 'empty')
    end
  end

end
