class RemoveTypeColumn < ActiveRecord::Migration[7.1]
  def change
    remove_column :animes, :type
  end
end
