# frozen_string_literal: true

# language欄を追加
class AddLanguageToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :language, :string
  end
end
