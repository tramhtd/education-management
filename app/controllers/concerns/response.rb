module Response
  def render_response_success(data_render)
    render json: {
      success: true,
      data: data_render
    }
  end

  def render_response_error(message, status = :bad_request)
    render json: {
      success: false,
      error: message
    }, status: status
  end
end
