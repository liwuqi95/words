class Quiz < ApplicationRecord
  has_many :quiz_records
  belongs_to :chapter
end
