class CreateTestRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :test_records do |t|
      t.integer :test_id
      t.integer :word_id
      t.boolean :result

      t.timestamps
    end
  end
end
