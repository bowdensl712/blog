# frozen_string_literal: true

# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  commenter  :string
#  body       :text
#  article_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  status     :integer
#  image_link :string
#
# 作成されたコメント
class Comment < ApplicationRecord
  include Visible

  enum status: { public_comment: 0, private_comment: 1, archived_comment: 2 }

  belongs_to :article
  validates :image_link, length: { maximum: 1000 }
end
