class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  has_many :reviews, dependent: :destroy
end
