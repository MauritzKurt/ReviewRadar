class ChangeLogoImageDefaultForProducts < ActiveRecord::Migration[7.1]
  def change
    change_column_default :products, :logo_image, "product_logo_placeholder.png"
  end
end
