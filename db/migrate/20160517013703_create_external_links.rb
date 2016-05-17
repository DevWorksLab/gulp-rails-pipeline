class CreateExternalLinks < ActiveRecord::Migration
  def change
    create_table :external_links do |t|
      t.string :link_type
      t.string :title
      t.string :url

      t.timestamps null: false
    end
  end
end
