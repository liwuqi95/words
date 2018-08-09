class Chapter < ApplicationRecord
  has_many :chapter_words, dependent: :destroy
  has_many :words, through: :chapter_words
  has_many :lessons
  has_many :quizzes

  belongs_to :library

  validates :name, :library_id, presence: true
  validates :name, uniqueness: { scope: :library_id }


  def full_text
    self.library.version + self.library.book + self.name

  end

end
