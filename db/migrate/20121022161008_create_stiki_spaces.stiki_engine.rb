# This migration comes from stiki_engine (originally 20120731063610)
class CreateStikiSpaces < ActiveRecord::Migration
  def change
    create_table :stiki_spaces do |t|
      t.string :name
      t.string :slug
      t.timestamps
    end
    add_index :stiki_spaces, :slug, unique: true
  end
end
