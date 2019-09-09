class Dish < ApplicationRecord
  belongs_to :restaurant
  has_many :orders

  mount_uploader :photo, PhotoUploader
  monetize :price_cents

  include PgSearch::Model

  pg_search_scope :search_by_dish,
    against: [:name, :description, :category],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
