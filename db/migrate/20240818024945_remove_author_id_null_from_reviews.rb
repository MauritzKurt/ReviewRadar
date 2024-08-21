class RemoveAuthorIdNullFromReviews < ActiveRecord::Migration[7.1]
  def change
    change_column_null :reviews, :author_id, true
  end
end
