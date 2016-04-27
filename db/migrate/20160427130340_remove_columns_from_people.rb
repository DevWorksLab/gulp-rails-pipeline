class RemoveColumnsFromPeople < ActiveRecord::Migration
  def change
    remove_column :people, :header_pic
    remove_column :people, :profile_pic
    remove_column :people, :skill_one_icon
    remove_column :people, :skill_two_icon
    remove_column :people, :skill_three_icon

  end
end
