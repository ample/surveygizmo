require 'surveygizmo/error/server_error'

module Surveygizmo
  class Error
    # Raised when Surveygizmo returns an unknown error
    class UnknownError < Surveygizmo::Error::ServerError
      ERROR_CODE = :unknown_error
      MESSAGE = "Unknown Error"

      def self.from_response(response={})
        code = response[:body][:code]
        message = response[:body][:message]

        new(code, message, response[:response_headers])
      end
    end
  end
end
