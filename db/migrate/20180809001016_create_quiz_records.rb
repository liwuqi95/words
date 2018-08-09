class CreateQuizRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :quiz_records do |t|
      t.string :quiz_id
      t.integer :word_id

      t.timestamps
    end
  end
end
