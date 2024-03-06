class ChangeRankToDecimalInAnimes < ActiveRecord::Migration[7.1]
  def change
    change_column :animes, :rank, :decimal
  end
end
