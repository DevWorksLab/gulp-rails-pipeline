class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.text :bio
      t.string :email
      t.string :linkedin
      t.string :twitter
      t.string :title
      t.string :snippet
      t.string :header_pic
      t.string :profile_pic
      t.string :skill_one
      t.string :skill_one_icon
      t.string :skill_one_blurb
      t.string :skill_two
      t.string :skill_two_icon
      t.string :skill_two_blurb
      t.string :skill_three
      t.string :skill_three_icon
      t.string :skill_three_blurb

      t.timestamps null: false
    end
  end
end
