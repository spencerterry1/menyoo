class Dish < ApplicationRecord
  belongs_to :restaurant

  mount_uploader :photo, PhotoUploader
  monetize :price_cents
end
