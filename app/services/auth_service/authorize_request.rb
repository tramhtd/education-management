module AuthService
  class AuthorizeRequest
    def initialize(headers = {}, params = {})
      @headers = headers
      @params = params
    end

    def call
      {
        user: user
      }
    end

    private

    attr_reader :headers
    attr_reader :params

    def user
      @user ||= User.find(decoded_auth_token[:user_id]) if decoded_auth_token
    rescue ActiveRecord::RecordNotFound => e
      raise(
        ExceptionHandler::InvalidToken,
        ("#{Message.invalid_token} #{e.message}")
      )
    end

    def decoded_auth_token
      @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
    rescue JWT::ExpiredSignature => e
    rescue JWT::ImmatureSignature => e
      raise(
        ExceptionHandler::InvalidToken,
        ("#{Message.invalid_token} #{e.message}")
      )
    end

    def http_auth_header
      if headers["Authorization"].present?
        return headers["Authorization"].split(" ").last
      elsif params[:token].present?
        return params[:token].split(" ").last
      end
      raise ExceptionHandler::MissingToken
    end
  end
end
