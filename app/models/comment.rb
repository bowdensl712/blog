class Comment < ApplicationRecord
  include Visible

  belongs_to :article
  validates :image_link, length: { maximum: 1000 }
end
