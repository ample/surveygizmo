require 'surveygizmo/error'

module Surveygizmo
  class Error
    class ServerError < Surveygizmo::Error
      MESSAGE = "Server Error"

      def self.from_response(response={})
        new(nil, response[:response_headers])
      end

      def initialize(message=nil, response_headers={})
        super((message || self.class.const_get(:MESSAGE)), response_headers)
      end

    end
  end
end
