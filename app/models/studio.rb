class Studio < ApplicationRecord
  has_many :animes
  validates :studio_name, presence: true, uniqueness: true
end
