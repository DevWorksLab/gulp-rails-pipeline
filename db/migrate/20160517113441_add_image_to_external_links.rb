class AddImageToExternalLinks < ActiveRecord::Migration
  def change
    add_column :external_links, :image, :string
  end
end
