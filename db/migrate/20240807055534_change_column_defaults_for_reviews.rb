class ChangeColumnDefaultsForReviews < ActiveRecord::Migration[7.1]
  def change
    change_column_default :reviews, :status, false
  end
end
