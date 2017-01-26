class Product < ApplicationRecord
  has_many :orders
  validates :name, presence: true
  validates :description, presence: true
  validates :image_url, presence: true
  validates :colour, presence: true
  validates :price, presence: true,
                    numericality: true
end
