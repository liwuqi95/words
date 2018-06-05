class Library < ApplicationRecord

  has_many :tests
  has_many :chapters

  validates :book, presence: true

  enum version: ['鲁教版','新派少儿英语']
end
