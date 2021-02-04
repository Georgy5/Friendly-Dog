class Dog < ApplicationRecord
  geocoded_by :city
  after_validation :geocode, if: :will_save_change_to_city?
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo

  CATEGORIES = ['guide dog', 'emotional support', 'kid-friendly', 'search and rescue']
  validates :name, presence: true
  validates :breed, presence: true
  validates :size, presence: true, inclusion: { in: ['small', 'med-small', 'medium', 'med-large', 'large'] }
  validates :category, presence: true, inclusion: { in: CATEGORIES }
  validates :city, presence: true
end
