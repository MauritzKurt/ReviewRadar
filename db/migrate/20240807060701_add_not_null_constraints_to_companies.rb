class AddNotNullConstraintsToCompanies < ActiveRecord::Migration[7.1]
  def change
    change_column_null :companies, :description , false
    change_column_null :companies, :name , false
    change_column_null :companies, :url , false
  end
end
