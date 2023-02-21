# frozen_string_literal: true

# 写真欄を追加
class AddImageLinkToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :image_link, :string
  end
end
