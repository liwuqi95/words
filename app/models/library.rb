class Library < ApplicationRecord
  has_many :word_libraries, :dependent => :destroy
  has_many :words, through: :word_libraries
  has_many :tests

  validates :book, presence: true



  enum version: ['鲁教版','新派少儿英语']
end
