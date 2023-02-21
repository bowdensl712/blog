# frozen_string_literal: true

# status欄を追加
class AddStatusToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :status, :string
  end
end
