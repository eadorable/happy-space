class Rate < ApplicationRecord
  has_many :plays
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
end
