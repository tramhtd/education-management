module ExceptionHandler
  include Response
  extend ActiveSupport::Concern

  included do
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

end
