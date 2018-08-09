class CreateQuizzes < ActiveRecord::Migration[5.1]
  def change
    create_table :quizzes do |t|
      t.integer :chapter_id
      t.integer :user_id

      t.timestamps
    end
  end
end
