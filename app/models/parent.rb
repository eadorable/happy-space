class Parent < ApplicationRecord
  has_many :plays, dependent: :destroy
  validates :name, presence: true


  before_create :generate_control_number


  def generate_control_number
    self.control_number = SecureRandom.hex(4)
  end

end
