class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :content, presence: true,
    length: { maximum: Settings.comment.content_maximum }
end
