class Order < ApplicationRecord
  belongs_to :dish
  belongs_to :attendee

  before_save :default_values

  def default_values
    self.quantity = 1 if self.quantity.nil?
    self.ordered = false if self.ordered.nil?
  end
end
