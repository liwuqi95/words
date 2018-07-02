class Addseperationtowords < ActiveRecord::Migration[5.1]
  def change
    add_column :words, :seperate, :string
  end
end
