class ChapterWord < ApplicationRecord
  belongs_to :word
  belongs_to :chapter

  validates :word, uniqueness: { scope: :chapter }
end
