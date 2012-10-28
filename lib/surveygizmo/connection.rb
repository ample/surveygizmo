require 'faraday_middleware'
require 'digest/md5'

module Surveygizmo
  # @private
  module Connection

    private
      def connection(options= {})
        Faraday.new(options) do |builder|
          builder.use Faraday::Request::UrlEncoded
          builder.use Faraday::Response::Mashify
          builder.use Faraday::Response::ParseJson
          builder.adapter(:net_http)
        end
      end

  end
end