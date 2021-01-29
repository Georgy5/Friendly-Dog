class Dog < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :name, presence: true
  validates :breed, presence: true
  validates :size, presence: true, inclusion: { in: ['small', 'med-small', 'medium', 'med-large', 'large'] }
  validates :category, presence: true, inclusion: { in: ['seeing-eye-dog', 'emotional support', 'kid-friendly', 'underdog'] }
  validates :city, presence: true
end
