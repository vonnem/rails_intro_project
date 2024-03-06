class CreateAnimes < ActiveRecord::Migration[7.1]
  def change
    create_table :animes do |t|
      t.integer :rank
      t.string :title
      t.decimal :score
      t.references :studio, null: false, foreign_key: true

      t.timestamps
    end
  end
end
