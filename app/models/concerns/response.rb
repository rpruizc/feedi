module Response
  ACCESS_TOKEN_EXCEPTION = 'AccessTokenException'
  
  def json_success_response
    render json: {}, status: :ok
  end

  def json_response_with_serializer(object, serializer, status = :ok)
    render json: Object.const_get(serializer).new(object) 
  end
  
  def json_error_response(error_type, error_message, status)
    render json: { error_type: error_type, error_message: error_message }, status: status
  end
end