class AddPriorityAndActiveToPeople < ActiveRecord::Migration
  def change
    add_column :people, :priority, :integer, index: true
    add_column :people, :active, :boolean, default: true
  end
end
