class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :title
      t.string :genre
      t.string :platform
      t.string :image

      t.timestamps
    end
  end
end
