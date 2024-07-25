class ChangeDefaultLogoImageInCompanies < ActiveRecord::Migration[7.1]
  def change
    change_column_default :companies, :logo_image, 'logo_placeholder.png'
  end
end
