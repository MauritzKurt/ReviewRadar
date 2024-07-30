class RemoveRedundantColumnsFromReviews < ActiveRecord::Migration[7.1]
  def change
    remove_column :reviews, :product_id, :integer if column_exists?(:reviews, :product_id)
    remove_column :reviews, :company_id, :integer if column_exists?(:reviews, :company_id)
  end
end
