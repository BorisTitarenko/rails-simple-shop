class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :adress
      t.decimal :sub_total
      t.string :status, default: "card"
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
