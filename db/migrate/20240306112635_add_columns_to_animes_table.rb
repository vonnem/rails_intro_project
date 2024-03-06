class AddColumnsToAnimesTable < ActiveRecord::Migration[7.1]
  def change
    add_column :animes, :popularity, :integer
    add_column :animes, :duration, :integer
    add_column :animes, :start_date, :string
    add_column :animes, :end_date, :string
    add_column :animes, :type, :string
    add_column :animes, :members, :string
  end
end
