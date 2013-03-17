class RemoveCategoriesFromEntry < ActiveRecord::Migration
  def up
    remove_column :entries, :categories
  end

  def down
    add_column :entries, :categories, :text
  end
end
