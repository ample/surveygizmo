require 'faraday'
require 'surveygizmo/error/service_unavailable'

module Surveygizmo
  module Response
    class RaiseError < Faraday::Response::Middleware

      def on_complete(env)
        if env[:body] && env[:body][:result_ok] == false
          error_code = env[:body][:code].to_i

          error_class = @klass.errors[error_code]
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
