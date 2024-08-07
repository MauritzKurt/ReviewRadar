class AddNotNullRequirementsToReviews < ActiveRecord::Migration[7.1]
  def change
    change_column_null :reviews, :body, false
    change_column_null :reviews, :title, false
  end
end
