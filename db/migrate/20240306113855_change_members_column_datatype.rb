class ChangeMembersColumnDatatype < ActiveRecord::Migration[7.1]
  def change
    change_column :animes, :members, :integer
  end
end
