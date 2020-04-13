class MessagesController < ApplicationController
  def create
    message = Message.new(message_params)

    if message.save
      return render json: { message: 'ok' }, status: 201
    else
      return render json: { message: 'failed to save', status: 422 }
    end
  end

  def index
    @messages = Message.all

    render json: { messages: @messages.to_a.to_json }
  end

  private

  def message_params
    params.require(:message).permit(:user_token, :user_name, :body)
  end
end
