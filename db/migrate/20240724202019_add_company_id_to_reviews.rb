class AddCompanyIdToReviews < ActiveRecord::Migration[7.1]
  def change
    add_column :reviews, :company_id, :integer
  end
end
