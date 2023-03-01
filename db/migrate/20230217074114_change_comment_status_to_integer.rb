class ChangeCommentStatusToInteger < ActiveRecord::Migration[7.0]
  def change
    change_column :comments, :status, :integer
  end
end
