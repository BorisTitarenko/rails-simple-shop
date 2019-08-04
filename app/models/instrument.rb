class Instrument < ApplicationRecord
  belongs_to :user, optional: true
  has_one_attached :image

  validates :brand, :model, :condition, :price, presence: true
  validates :description, length: {maximum: 500, too_long: "Too long!"}
  validates :price, numericality: {only_integer: true}, length: {maximum: 7}

  BRAND = ["Fender", "Gibson", "Jackson", "Taylor", "Yamaha"]
  FINISH = ["Black", "White", "Yelow", "Red", "Navi", "Clear", "Satin"]
  CONDITION = ["New", "Excelent", "Used", "Poor"]


end
