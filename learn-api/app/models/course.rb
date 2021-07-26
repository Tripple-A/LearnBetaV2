class Course < ApplicationRecord
  validates :title, presence: true
  validates :shortDescription, presence: true
  validates :url, presence: true
  validates :imgUrl, presence: true
  validates :providerRatings, presence: true
  validates :duration, presence: true
  validates :provider, presence: true
  validates :author, presence: true
  validates :level, presence: true
  validates :medium, presence: true
  validates :language, presence: true
  validates :category, presence: true
  validates :broad_category, presence: true
  validates :tags, presence: true
  has_many :favorites
end
