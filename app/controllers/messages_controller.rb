class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_conversation

  def index
    @messages = @conversation.messages
    @message = @conversation.messages.new
  end

  def create

  end

  def new
    @message = @conversation.messages.new(message_params)
    if @message.save
      redirect_to conversation_messages_path(@conversation)
    end
  end


  private
  def find_conversation
    @conversation = Conversation.find(params[:conversation_id])
  end

  def message_params
    p = params.require(:message).permit(:body, :user_id)
  end
end
