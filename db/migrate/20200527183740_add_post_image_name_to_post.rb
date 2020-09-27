class AddPostImageNameToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :post_image_name, :string
  end
end
