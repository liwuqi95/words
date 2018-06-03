class Word < ApplicationRecord
  has_many :word_libraries, :dependent => :destroy
  has_many :libraries, through: :word_libraries
  has_many :test_records


  validates :word, presence: true, uniqueness: true
  validates :meaning, presence: true
end
