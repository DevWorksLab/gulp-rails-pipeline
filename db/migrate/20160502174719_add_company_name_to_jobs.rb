class AddCompanyNameToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :company_name, :string
  end
end
