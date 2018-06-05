class ChangeLibrary < ActiveRecord::Migration[5.1]
  def change
    remove_column :libraries, :grade, :integer
    remove_column :libraries, :name, :string

    add_column :libraries, :version, :integer, default: 0, null: false
    add_column :libraries, :book, :string
  end
end
