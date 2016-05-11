class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.integer :catsone_id
      t.string :title
      t.string :location
      t.text :description
      t.text :notes
      t.integer :recruiter_id
      t.integer :owner_id
      t.string :category_name
      t.boolean :is_hot
      t.date :start_date
      t.string :salary
      t.string :duration
      t.integer :openings
      t.string :external_id
      t.integer :company_id
      t.string :contact_id
      t.integer :status_id
      t.string :type
      t.json :links
      t.json :embedded
      t.json :status

      t.timestamps null: false
    end
  end
end
