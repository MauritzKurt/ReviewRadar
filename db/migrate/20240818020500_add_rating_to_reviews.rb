# db/migrate/20240818020500_add_rating_to_reviews.rb
class AddRatingToReviews < ActiveRecord::Migration[7.1]
  def change
    add_column :reviews, :rating, :integer, null: false, default: 3
  end
end
