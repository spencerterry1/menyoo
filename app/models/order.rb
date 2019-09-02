class Order < ApplicationRecord
  belongs_to :dish
  belongs_to :attendee
end
