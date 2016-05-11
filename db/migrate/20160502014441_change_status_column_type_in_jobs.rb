class ChangeStatusColumnTypeInJobs < ActiveRecord::Migration
  def change
    change_column :jobs, :status, :string
  end
end
