class AddPendingToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :pending, :boolean, null: false, default: false
  end
end
