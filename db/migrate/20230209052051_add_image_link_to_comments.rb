class AddImageLinkToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :image_link, :string
  end
end
