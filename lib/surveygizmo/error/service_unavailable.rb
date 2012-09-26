require 'surveygizmo/error/server_error'

module Surveygizmo
  class Error
    # Raised when Surveygizmo returns the error code 103
    class ServiceUnavailable < Surveygizmo::Error::ServerError
      ERROR_CODE = 103
      MESSAGE = "Service currently unavailable"
    end
  end
end
