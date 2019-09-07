class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  has_many :reviews, dependent: :destroy
  has_many :attendees, dependent: :destroy
  has_many :orders, through: :attendees
end
