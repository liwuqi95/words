class Test < ApplicationRecord
  belongs_to :library

  validates :user_id, presence: true
  validates :library_id, presence: true

end
