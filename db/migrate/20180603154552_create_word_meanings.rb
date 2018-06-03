class CreateWordMeanings < ActiveRecord::Migration[5.1]
  def change
    create_table :word_meanings do |t|
      t.integer :word_id
      t.string :meaning
      t.integer :character, default: 0, null: false

      t.timestamps
    end
  end
end
