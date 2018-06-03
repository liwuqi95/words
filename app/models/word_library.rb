class WordLibrary < ApplicationRecord
  belongs_to :word
  belongs_to :library

  validates :word_id, presence: true
  validates :library_id, presence: true
end
