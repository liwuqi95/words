class ChapterWord < ApplicationRecord
  belongs_to :word
  belongs_to :chapter

  validates :word_id, :chapter_id, presence: true
  validates :word, uniqueness: { scope: :chapter }
end
