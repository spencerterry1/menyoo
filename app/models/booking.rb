class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  has_many :reviews, dependent: :destroy
  has_many :attendees, dependent: :destroy
  has_many :orders, through: :attendees
  before_save :default_values
  validates :date, presence: true


  def default_values
    self.open = true if self.open.nil?
    self.ordered = false if self.ordered.nil?
    self.checkedin = false if self.checkedin.nil?
    self.service_status = false if self.service_status.nil?
    self.bill_payment = false if self.bill_payment.nil?
  end
end
