class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.text :content
      t.integer :rating
      t.references :user, null: false, foreign_key: true
      t.references :reviewer, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
