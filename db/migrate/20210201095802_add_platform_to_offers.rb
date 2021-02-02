class AddPlatformToOffers < ActiveRecord::Migration[6.0]
  def change
    add_column :offers, :platform, :string
  end
end
