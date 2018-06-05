class CreateChapterWords < ActiveRecord::Migration[5.1]
  def change
    create_table :chapter_words do |t|
      t.integer :chapter_id
      t.integer :word_id

      t.timestamps
    end
  end
end
