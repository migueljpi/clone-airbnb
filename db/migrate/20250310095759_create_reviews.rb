class CreateReviews < ActiveRecord::Migration[7.2]
  def change
    create_table :reviews do |t|
      t.text :review_content
      t.integer :tour_rating
      t.integer :guide_rating
      t.references :booking, null: false, foreign_key: true

      t.timestamps
    end
  end
end
