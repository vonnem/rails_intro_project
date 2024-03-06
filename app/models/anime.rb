class Anime < ApplicationRecord
  belongs_to :studio
  validates :episodes, :title, :score, presence: true
  validates :score, :episodes, numericality: true
end
