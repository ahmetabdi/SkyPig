# This migration comes from stiki_engine (originally 20120731063721)
class CreateStikiAuthors < ActiveRecord::Migration
  def change
    create_table :stiki_authors do |t|
      t.integer :user_id
      t.integer :authorable_id
      t.string  :authorable_type
      t.boolean :creator
      t.boolean :last_edit
      t.timestamps
    end
    
    add_index :stiki_authors, [:authorable_id, :authorable_type]
  end
end
