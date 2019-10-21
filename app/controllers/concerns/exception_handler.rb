module ExceptionHandler
  include Response
  extend ActiveSupport::Concern
  class AuthenticationError < StandardError; end
  class MissingToken < StandardError; end
  class InvalidToken < StandardError; end

  included do
    rescue_from MissingToken, with: :four_twenty_two
    rescue_from InvalidToken, with: :four_twenty_two

    rescue_from AuthenticationError do |e|
      render_response_error("Username or password incorrect", :unauthorized)
    end

    rescue_from ActiveRecord::RecordNotFound do |e|
      render_response_error(e.message, :not_found)
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      render_response_error(e.message, :unprocessable_entity)
    end

    rescue_from ActionController::ParameterMissing do |e|
      render_response_error(e.message, :bad_request)
    end
  end

  private

  def four_twenty_two(e)
    render_response_error(e.message, :unprocessable_entity)
  end

end
