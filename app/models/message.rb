class Message < ApplicationRecord
  belongs_to :user
  belongs_to :conversation

  validates_presence_of :body, :user_id, :conversation_id

  def message_time
    self.created_at.strftime("%d/%m/%y at %H/%M/%S")
  end
end
