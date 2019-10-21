class AuthenticationController < ApplicationController
  skip_before_action :get_user

  def register
    render_response_success(AuthService::Register.call(register_params))
  end

  def login
    auth_token = AuthService::Login.new(login_params[:username], login_params[:password]).call
    render_response_success(auth_token)
  end

  private

  def register_params
    params.require(%i[name address gender username password])
    params.permit(:name, :address, :gender, :username, :password)
  end

  def login_params
    params.require(%i[username password])
    params.permit(:username, :password)
  end

end
