class Article < ApplicationRecord
  include Visible

  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true
  validates :image_link, length: { maximum: 1000 }

  def self.ransackable_attributes(auth_object = nil)
    %w[title body language created_at]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[articles comments]
  end

  scope :created_after, ->(time) {
    # time = year.to_s + "-" + month.to_s + "-" + day.to_s
    time = time.to_time
    puts time
    where('created_at > ?', time)
  }
  scope :created_before, ->(time) {
    # time = year.to_s + "-" + month.to_s + "-" + day.to_s
    time = time.to_time
    time = time + 23.hours + 59.minutes
    puts time
    where('created_at < ?', time)
  }

  def self.ransackable_scopes(auth_object = nil)
    %w[created_after created_before]
  end
end
