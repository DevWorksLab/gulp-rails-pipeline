class AddOtherImageToPeople < ActiveRecord::Migration
  def change
    add_column :people, :other_image, :string
  end
end
