class Venue < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_many :favourites, dependent: :destroy
  validates :address1, presence: true, allow_blank: false
  validates :address2, presence: true
end
