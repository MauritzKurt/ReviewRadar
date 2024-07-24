class ChangeDefaultAvatarImageInUsers < ActiveRecord::Migration[7.1]
  def change
    change_column_default :users, :avatar_image, 'avatar_placeholder.png'
  end
end
