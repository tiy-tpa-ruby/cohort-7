class Note < ApplicationRecord
  validates :body, presence: true
  validates :title, presence: true

  has_many :taggings
  has_many :tags, through: :taggings
end
