class Library < ApplicationRecord

  has_many :tests

  validates :book, presence: true



  enum version: ['鲁教版','新派少儿英语']
end
