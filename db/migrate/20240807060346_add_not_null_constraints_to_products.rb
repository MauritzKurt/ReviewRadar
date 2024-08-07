class AddNotNullConstraintsToProducts < ActiveRecord::Migration[7.1]
  def change
    change_column_null :products, :name, false
    change_column_null :products, :description, false
    change_column_null :products, :company_id, false
    change_column_null :products, :url, false
  end
end
