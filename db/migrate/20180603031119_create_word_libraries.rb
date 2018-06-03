class CreateWordLibraries < ActiveRecord::Migration[5.1]
  def change
    create_table :word_libraries do |t|
      t.integer :word_id
      t.integer :library_id

      t.timestamps
    end
  end
end
