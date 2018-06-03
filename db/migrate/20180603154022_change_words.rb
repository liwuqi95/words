class ChangeWords < ActiveRecord::Migration[5.1]
  def change
    remove_column :words, :meaning, :string
    add_column :words, :phonetic, :string
  end
end
