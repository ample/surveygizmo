require 'surveygizmo/error'

module Surveygizmo
  class Error
    class ServerError < Surveygizmo::Error
      MESSAGE = "Server Error"

      def self.from_response(response={})
        new(nil, nil, response[:response_headers])
      end

      def initialize(code=nil, message=nil, response_headers={})
        code ||= self.class.const_get(:ERROR_CODE)
        message ||= self.class.const_get(:MESSAGE)
        super(code, message, response_headers)
      end

    end
  end
end
