class AddColumsBackToPeople < ActiveRecord::Migration
  def change
    add_column :people, :header_pic, :string
    add_column :people, :profile_pic, :string
    add_column :people, :skill_one_icon, :string
    add_column :people, :skill_two_icon, :string
    add_column :people, :skill_three_icon, :string
  end
end
