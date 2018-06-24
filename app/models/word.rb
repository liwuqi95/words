class Word < ApplicationRecord

  has_many :test_records
  has_many :word_meanings, dependent: :destroy
  has_many :chapter_words, dependent: :destroy


  has_many :chapters, through: :chapter_words

  accepts_nested_attributes_for :word_meanings


  validates :word, presence: true, uniqueness: true


end
