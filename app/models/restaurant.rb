class Restaurant < ApplicationRecord
  geocoded_by :address
    after_validation :geocode, if: :will_save_change_to_address?

  has_many :dishes, dependent: :destroy
  validates :name, presence: true
  validates :address, presence: true
  validates :category, presence: true

  mount_uploader :photo, PhotoUploader
end
