class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :company_id
      t.string :url

      t.timestamps
    end
  end
end
