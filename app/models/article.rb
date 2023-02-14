class Article < ApplicationRecord
    include Visible

    has_many :comments, dependent: :destroy

    validates :title, presence: true 
    validates :body, presence: true
    validates :image_link, length: { maximum: 1000 }

    def self.ransackable_attributes(auth_object = nil)
        %w(title body)
    end

    def self.ransackable_associations(auth_object = nil)
        %w(articles comments)
    end

end 
