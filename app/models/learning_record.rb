class LearningRecord < ApplicationRecord
  validates :word_id, :chapter_id, :user_id, presence: true
end
