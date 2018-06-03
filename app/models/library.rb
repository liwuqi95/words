class Library < ApplicationRecord
  has_many :word_libraries, :dependent => :destroy
  has_many :words, through: :word_libraries
  has_many :tests

  validates :name, presence: true
  validates :grade, presence: true
end
