# frozen_string_literal: true

# status欄をenumに変更
class ChangeArticleStatusToInteger < ActiveRecord::Migration[7.0]
  def change
    change_column :articles, :status, :integer
  end
end
