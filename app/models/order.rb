class Order < ApplicationRecord
  enum status: {empty: 'empty', cart: 'cart', open: 'open', canceled: "canceled"}
  has_many :order_items
  belongs_to :user

  after_update :change_items_status, if: Proc.new { |order| order.open?}

  private
  def change_items_status
    self.order_items.each do |o|
      o.instrument.update_attributes(status: "waiting")
    end

  end
end
