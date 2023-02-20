# frozen_string_literal: true

# language欄をenumに変更
class ChangeArticleLanguageToInteger < ActiveRecord::Migration[7.0]
  def change
    change_column :articles, :language, :integer
  end
end
