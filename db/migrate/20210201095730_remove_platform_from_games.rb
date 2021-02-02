class RemovePlatformFromGames < ActiveRecord::Migration[6.0]
  def change
    remove_column :games, :platform, :string
  end
end
