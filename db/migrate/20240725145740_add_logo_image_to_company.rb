class AddLogoImageToCompany < ActiveRecord::Migration[7.1]
  def change
    add_column :companies, :logo_image, :string
  end
end
