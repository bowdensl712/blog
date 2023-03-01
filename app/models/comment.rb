# frozen_string_literal: true

# 作成されたコメント
class Comment < ApplicationRecord
  include Visible

  enum status: { public_comment: 0, private_comment: 1, archived_comment: 2 }

  belongs_to :article
  validates :image_link, length: { maximum: 1000 }
end
