class Instrument < ApplicationRecord
  belongs_to :user, optional: true
  has_one_attached :image
  has_one :order_item, dependent: :destroy

  validates :brand, :model, :condition, :price, presence: true
  validates :description, length: {maximum: 500, too_long: "Too long!"}
  validates :price, length: {maximum: 7}

  BRAND = ["Fender", "Gibson", "Jackson", "Taylor", "Yamaha"]
  FINISH = ["Black", "White", "Yelow", "Red", "Navi", "Clear", "Satin"]
  CONDITION = ["New", "Excelent", "Used", "Poor"]


end
