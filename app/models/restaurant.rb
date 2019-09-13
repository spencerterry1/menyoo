class Restaurant < ApplicationRecord
  geocoded_by :address
    after_validation :geocode, if: :will_save_change_to_address?


  has_many :dishes, dependent: :destroy
  has_many :bookings
  has_many :reviews, through: :bookings, dependent: :destroy

  validates :name, presence: true
  validates :address, presence: true
  validates :category, presence: true

  mount_uploader :photo, PhotoUploader

  include PgSearch::Model

  pg_search_scope :search_by_restaurant,
    against: [:name, :address, :category],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

  def avarage_rating
    return 0 if reviews.empty?

    ratings = reviews.map(&:rating).compact
    (ratings.sum / ratings.size.to_f).round(1)
  end

end
