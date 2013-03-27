class CreateClips < ActiveRecord::Migration

  def self.up
    create_table :clips do |t|
      t.integer :entry_id

      t.timestamps
    end

    add_index :clips, :entry_id, :unique => true
  end

  def self.down
    drop_table :clips
  end
end
