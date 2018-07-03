class Word < ApplicationRecord

  has_many :test_records
  has_many :learning_records
  has_many :word_meanings, dependent: :destroy
  has_many :chapter_words, dependent: :destroy


  has_many :chapters, through: :chapter_words

  accepts_nested_attributes_for :word_meanings


  validates :word, presence: true, uniqueness: true


  def test_accuracy(chapter, user)
    total_rocords =  self.test_records.user(user).chapter(chapter)
    correct_records = total_rocords.correct(true)
    (total_rocords.size == 0) ? 0 : correct_records.size.to_f / total_rocords.size.to_f
  end

  def test_recent(chapter, user)
    total_rocords =  self.test_records.user(user).chapter(chapter)

    recent_record = total_rocords.order(created_at: :desc).first

    recent_record ? recent_record.created_at : nil

  end

  def test_count(chapter, user)
    total_rocords =  self.test_records.user(user).chapter(chapter)

    total_rocords.size
  end

  def passed(chapter, user)
     self.test_accuracy(chapter, user) > 0.67 && self.test_count(chapter, user) >= 3
  end



end
