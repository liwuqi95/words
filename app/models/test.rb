class Test < ApplicationRecord
  belongs_to :library
  belongs_to :user

  has_many :test_records

  validates :user_id, presence: true
  validates :library_id, presence: true

end
