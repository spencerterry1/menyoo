class Attendee < ApplicationRecord
  belongs_to :user
  belongs_to :booking
  has_many :orders, dependent: :destroy
  has_many :payments, dependent: :destroy

  before_save :default_values

  def default_values
    self.accepted = false if self.accepted.nil?
    self.payment = false if self.payment.nil?
  end

end
