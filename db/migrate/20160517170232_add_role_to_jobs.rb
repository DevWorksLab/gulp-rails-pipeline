class AddRoleToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :role, :string
  end
end
