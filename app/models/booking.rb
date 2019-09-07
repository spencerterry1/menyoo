class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  has_many :reviews, dependent: :destroy
  has_many :attendees, dependent: :destroy

  before_save :default_values

  def default_values
    self.open = true if self.open.nil?
  end
end
