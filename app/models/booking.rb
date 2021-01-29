class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :dog

  validates :date, presence: true
  validates :status, presence: true, inclusion: { in: ['pending', 'approved', 'denied'] }
end
