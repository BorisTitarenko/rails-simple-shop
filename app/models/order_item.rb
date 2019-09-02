class OrderItem < ApplicationRecord
  belongs_to :instrument
  belongs_to :order

  after_create do
    if self.order.empty?
      self.order.cart!
    end
  end


  after_destroy do
    self.instrument.active!
    if OrderItem.where(order_id: self.order_id).empty?
      self.order.empty!
    end
  end

end
