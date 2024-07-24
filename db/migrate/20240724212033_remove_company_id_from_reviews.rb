class RemoveCompanyIdFromReviews < ActiveRecord::Migration[7.1]
  def change
    remove_column :reviews, :company_id, :integer
  end
end
