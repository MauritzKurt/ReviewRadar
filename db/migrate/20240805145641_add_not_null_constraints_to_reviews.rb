class AddNotNullConstraintsToReviews < ActiveRecord::Migration[7.1]
  def change
    change_column_null :reviews, :title, false
    change_column_null :reviews, :author_id, false
    change_column_null :reviews, :body, false
  end
end
