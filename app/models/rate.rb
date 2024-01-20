class Rate < ApplicationRecord
  has_many :plays, dependent: :destroy
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
end
