# frozen_string_literal: true

# 作成された記事
class Article < ApplicationRecord
  include Visible

  has_many :comments, dependent: :destroy

  enum language: { English: 1, Japanese: 2 }
  enum status: { public_article: 1, private_article: 2, archived_article: 3 }

  validates :title, presence: true
  validates :body, presence: true
  validates :image_link, length: { maximum: 1000 }

  def self.ransackable_attributes(_auth_object = nil)
    %w[title body language created_at]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[articles comments]
  end

  scope :created_after, ->(time) {
    # time = year.to_s + "-" + month.to_s + "-" + day.to_s
    time = Time.zone.parse(time)
    puts time
    where('created_at >= ?', time)
  }
  scope :created_before, ->(time) {
    # time = year.to_s + "-" + month.to_s + "-" + day.to_s
    time = Time.zone.parse(time)
    time += 1.day
    puts time
    where('created_at < ?', time)
  }

  def self.ransackable_scopes(_auth_object = nil)
    %w[created_after created_before]
  end
end
