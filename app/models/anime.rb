class Anime < ApplicationRecord
  belongs_to :studio
  validates :episodes, :title, :score, presence: true
  validates :score, :episodes, numericality: true

  has_many :anime_genres
  has_many :genres, through :movie_genres
end
