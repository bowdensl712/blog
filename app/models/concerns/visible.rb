# frozen_string_literal: true

# 記事/コメントのstatusを扱う
module Visible
  extend ActiveSupport::Concern
  VALID_STATUSES = %w[public_article private_articles archived_article public_comment private_comment archived_comment].freeze

  included do
    validates :status, inclusion: { in: VALID_STATUSES }
  end

  class_methods do
    def public_count
      Article.public_article.count
    end
  end

  def archived?
    status == 'archived_article'
  end
end
