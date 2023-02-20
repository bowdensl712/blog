# frozen_string_literal: true

# status欄をenumに変更
class ChangeCommentStatusToInteger < ActiveRecord::Migration[7.0]
  def change
    change_column :comments, :status, :integer
  end
end
