class AddSourceToReviews < ActiveRecord::Migration[7.1]
  def change
    add_column :reviews, :source, :string, default: "ReviewRadar"
  end
end
