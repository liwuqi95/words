class QuizRecord < ApplicationRecord
  belongs_to :quiz
  belongs_to :word

  validates_uniqueness_of :word, scope: [:quiz]
end
