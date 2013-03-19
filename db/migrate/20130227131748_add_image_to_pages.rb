class AddImageToPages < ActiveRecord::Migration
  def change
  	add_column :stiki_pages, :image, :string
  end
end
