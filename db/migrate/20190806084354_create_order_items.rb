class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.belongs_to :instrument, foreign_key: true
      t.decimal :price
      t.belongs_to :order, foreign_key: true

      t.timestamps
    end
  end
end
