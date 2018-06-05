class Library < ApplicationRecord

  has_many :tests
  has_many :chapters, dependent: :destroy


  validates :book, :version, presence: true

  validates :book, uniqueness: { scope: :version }



  enum version: ['鲁教版','新派少儿英语']
end
