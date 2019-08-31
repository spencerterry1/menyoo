class Dish < ApplicationRecord
  belongs_to :restaurant

  mount_uploader :photo, PhotoUploader
end
