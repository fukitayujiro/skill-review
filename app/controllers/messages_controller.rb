class MessagesController < ApplicationController

  def create
    message = Message.create(message_params)
    redirect_to "/contents/#{message.content.id}"
  end

  private
  def message_params
    params.require(:message).permit(:point, :text).merge(user_id: current_user.id, content_id: params[:content_id])
  end
end
