class SessionsController < ApplicationController

  skip_before_filter :verify_authenticity_token, only: :create, if: -> { Rails.env.development? }

  def create
    auth = Authentication.new(env['omniauth.auth'])
    if auth.authenticated?
      session[:user_id] = auth.user.id
      redirect_to root_url, notice: 'Logged In'
    else
      flash.now.alert = "You are not authorized to use the system"
      render :new
    end
  end
end
