class CreateTestRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :test_records do |t|
      t.integer :word_id
      t.integer :user_id
      t.integer :chapter_id
      t.string  :answer
      t.boolean :correct

      t.timestamps
    end
  end
end