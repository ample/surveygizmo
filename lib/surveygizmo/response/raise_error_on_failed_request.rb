require 'faraday'
require 'surveygizmo/error'

module Surveygizmo
  class Response::RaiseErrorOnFailedRequest < Faraday::Response::Middleware

    def on_complete(env)
      if env[:body] && ! env[:body]["result_ok"]
        error_code = env[:body]["code"].to_i
        message = env[:body]["message"]

        raise @klass.new(error_code, message)
      end
    end

    def initialize(app, klass)
      @klass = klass
      super(app)
    end

  end
end
