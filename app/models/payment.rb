class Payment < ApplicationRecord
  belongs_to :attendee
  belongs_to :booking
end
