class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.integer :feed_id
      t.string :title
      t.text :url
      t.text :categories
      t.text :summary
      t.datetime :published_at

      t.timestamps
    end
  end
end
