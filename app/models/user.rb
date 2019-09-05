class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  include PgSearch::Model
  pg_search_scope :search_by_first_name_and_last_name, against: [:first_name, :last_name, :email]

  mount_uploader :photo, PhotoUploader
  has_many :bookings, dependent: :destroy
  has_many :attendees, dependent: :destroy
  has_many :reviews, dependent: :destroy
end
