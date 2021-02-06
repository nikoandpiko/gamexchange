class AddScreenshotToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :screenshot, :string
  end
end
