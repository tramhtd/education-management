class ApplicationController < ActionController::API 
  include Response
  include ExceptionHandler
  before_action :get_user

  def get_user
    @current_user = AuthService::AuthorizeRequest.new(request.headers, params).call[:user]
  end
end
