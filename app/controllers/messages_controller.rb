class MessagesController < ApplicationController
  before_filter :require_login

  def index
    @messages = current_user.messages
  end

  def new
    @message = current_user.messages.build
    @message.recipients.build
  end

  def create
    @message = current_user.messages.build(message_params)
    @user = User.where(email: params[:email]).first_or_create
    @message.recipients << @user
    if @message.save
      redirect_to messages_path
    else
      render :new
    end
  end

  def show
    @message = current_user.messages.find(params[:id])
  end

  private

    def message_params
      params.require(:message).permit(:title, :body)
    end
end
