class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @conversations = Conversation.all
  end

  def create
    @conversation = Conversation.first_or_create!(conversation_params)
    redirect_to conversation_message_path
  end

  private
  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end
end
