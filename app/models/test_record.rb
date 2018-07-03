class TestRecord < ApplicationRecord
  belongs_to :word
  belongs_to :chapter
  belongs_to :user

  validates :word_id, :chapter_id, :user_id, presence: true

  before_save :set_correct


  scope :correct, -> (correct) { where correct: correct}
  scope :user, -> (user_id) { where user_id: user_id}
  scope :chapter, -> (chapter_id) { where chapter_id: chapter_id}


  def set_correct
    self.correct = (self.answer.downcase  == self.word.word.downcase )
  end

end
