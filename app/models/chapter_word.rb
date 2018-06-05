class ChapterWord < ApplicationRecord
  belongs_to :word
  belongs_to :chapter

  validates :word_id, :library_id, presence: true
  validates :word, uniqueness: { scope: :chapter }
end
