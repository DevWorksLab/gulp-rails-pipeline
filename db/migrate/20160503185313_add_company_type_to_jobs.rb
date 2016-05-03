class AddCompanyTypeToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :company_type, :string
  end
end
