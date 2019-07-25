class Message < ApplicationRecord
  resourcify
  belongs_to :user
  belongs_to :chat_room
  has_one_attached :image

  validates :body, length: {maximum: 1000}
  after_create_commit { MessageBroadcastJob.perform_later(self) }

  def timestamp
    created_at.strftime('%I:%M %p, %d %b')
  end
end
