class AddLogoImageToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :logo_image, :string, default: 'logo_placeholder.png'
  end
end
