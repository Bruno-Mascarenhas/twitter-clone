# frozen_string_literal: true

class Micropost < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validates :image, content_type: { in: %w[image/jped image/gif image/png], message: 'msut be a valid image format' },
                    size: { less_than: 3.megabytes, message: 'should be less than 3MB' }

  def display_image
    image.variant(resize_to_limit: [400, 400])
  end
end
