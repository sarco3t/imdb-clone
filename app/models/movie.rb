class Movie < ApplicationRecord
  paginates_per 10
  extend FriendlyId
  friendly_id :title, use: :slugged
  belongs_to :category
  has_many :ratings

  def average_rating
    ratings.average(:score) || 0
  end
end
