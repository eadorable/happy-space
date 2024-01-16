class Play < ApplicationRecord
  belongs_to :parent

  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }

  validates :number_of_kids, presence: true
  validates :number_of_kids, numericality: { greater_than: 0 }

  # validate :number_of_hours_validation, if: -> { Play.open_time == false }

  # def number_of_hours_validation
  #   errors.add(:number_of_hours, 'must be present') if number_of_hours.blank?
  #   errors.add(:number_of_hours, 'must be greater than 0') if number_of_hours.to_i <= 0
  # end
end
