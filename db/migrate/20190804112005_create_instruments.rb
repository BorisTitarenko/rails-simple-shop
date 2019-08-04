class CreateInstruments < ActiveRecord::Migration[5.2]
  def change
    create_table :instruments do |t|
      t.string :brand
      t.string :model
      t.text :description
      t.string :condition
      t.string :finish
      t.decimal :price
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
