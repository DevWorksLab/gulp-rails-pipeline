class CreateMonaArticles < ActiveRecord::Migration
  def change
    create_table :mona_articles do |t|
      t.string :url, default: ""
      t.timestamps null: false
    end
  end
end
