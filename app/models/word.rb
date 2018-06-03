class Word < ApplicationRecord
  has_many :word_libraries, :dependent => :destroy
  has_many :libraries, through: :word_libraries


  validates :word, presence: true
  validates :meaning, presence: true
end
