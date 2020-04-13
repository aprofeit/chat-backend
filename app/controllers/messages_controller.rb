class MessagesController < ApplicationController
  def create
    message = Message.new(message_params)

    if message.save
      return render json: { message: 'ok' }, status: 201
    else
      return render json: { message: 'failed to save', status: 422 }
    end
  end

  private

  def message_params
    params.require(:message).permit(:user_token, :user_name, :body)
  end
end
