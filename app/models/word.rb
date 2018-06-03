class Word < ApplicationRecord
  has_many :word_libraries, :dependent => :destroy
  has_many :libraries, through: :word_libraries
  has_many :test_records
  has_many :word_meanings


  accepts_nested_attributes_for :word_meanings


  validates :word, presence: true, uniqueness: true
  validates :phonetic, presence: true



end
