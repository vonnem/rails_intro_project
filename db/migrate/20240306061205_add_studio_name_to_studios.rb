class AddStudioNameToStudios < ActiveRecord::Migration[7.1]
  def change
    add_column :studios, :studio_name, :string
  end
end
