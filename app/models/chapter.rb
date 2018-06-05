class Chapter < ApplicationRecord
  has_many :chapter_words, dependent: :destroy
  has_many :words, through: :chapter_words

  belongs_to :library
end
