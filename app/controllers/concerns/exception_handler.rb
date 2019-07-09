module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from Exception, with: :handle_general_exceptions

    rescue_from ActiveRecord::RecordNotFound do |_exception|
      handle_exceptions('Record was not found', :not_found)
    end

    rescue_from ActionController::ParameterMissing do |_exception|
      handle_exceptions('Not all parameters have been provided', :bad_request)
    end

    rescue_from NameError do |_exception|
      handle_exceptions('You are trying to access undefined constant or class', :bad_request)
    end
  end

  private

  def handle_general_exceptions(_exception)
    handle_exceptions('Something went wrong', :internal_server_error)
  end

  def handle_exceptions(message, status)
    render json: { errors: message }, status: status
  end
end
