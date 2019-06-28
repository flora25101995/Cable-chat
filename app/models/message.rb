class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room
  has_one_attached :image
  def timestamp
    created_at.strftime('%H:%M %d %B')
  end
  validates :body, presence: true, length: {minimum: 2, maximum: 1000}
  after_create_commit { MessageBroadcastJob.perform_later(self) }
end
