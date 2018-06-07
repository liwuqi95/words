class CreateLessonRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :lesson_records do |t|
      t.integer :lesson_id
      t.integer :word_id

      t.timestamps
    end
  end
end
