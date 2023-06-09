class Message < ApplicationRecord
  validates :body, presence: true
  belongs_to :user

  after_create_commit -> { broadcast_append_to "messages_stream", partial: "messages/message", locals: { message: self }, target: "messages" }
end
