require 'faraday'
require 'surveygizmo/error/service_unavailable'
require 'surveygizmo/error/unknown_error'

module Surveygizmo
  module Response
    class RaiseError < Faraday::Response::Middleware

      def on_complete(env)
        if env[:body] && env[:body][:result_ok] == false
          error_code = env[:body][:code].to_i

          error_class = @klass.errors[error_code] || @klass.errors[:unknown_error]
          raise error_class.from_response(env) if error_class
        end
      end

      def initialize(app, klass)
        @klass = klass
        super(app)
      end

    end
  end
end
