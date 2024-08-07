class AddNotNullConstraintToAuthorIdForReviews < ActiveRecord::Migration[7.1]
  def change
    change_column_null :reviews, :author_id, false
  end
end
