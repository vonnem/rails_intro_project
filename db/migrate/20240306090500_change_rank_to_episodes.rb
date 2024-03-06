class ChangeRankToEpisodes < ActiveRecord::Migration[7.1]
  def change
    rename_column :animes, :rank, :episodes
  end
end
