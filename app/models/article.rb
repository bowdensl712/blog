class Article < ApplicationRecord
    include Visible

    has_many :comments, dependent: :destroy

    validates :title, presence: true 
    validates :body, presence: true
    validates :image_link, length: { maximum: 1000 }
end
