class AddAnswerToQuizRecord < ActiveRecord::Migration[5.1]
  def change
    add_column :quiz_records, :answer, :boolean
    add_column :quiz_records, :work, :boolean, :default => false
  end
end
