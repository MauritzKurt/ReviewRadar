class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.integer :author_id
      t.integer :product_id
      t.string :title
      t.text :body
      t.boolean :status

      t.timestamps
    end
  end
end
