class RentalDefaultStatus < ActiveRecord::Migration[6.0]
  def change
    change_column_default :rentals, :status, 'Pending'
  end
end
