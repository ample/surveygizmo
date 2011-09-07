require 'faraday_middleware'
require 'digest/md5'

module Surveygizmo
  # @private
  module Connection
    
    private

      def connection(temp_api_endpoint=nil)
        options = {
          :headers => { 'Accept' => 'application/json', 'User-Agent' => user_agent },
          :ssl => { :verify => false },
          :params => { :'user:md5' => "#{username}:#{Digest::MD5.hexdigest(password)}" }
        }

        options[:url] = temp_api_endpoint ? temp_api_endpoint : api_endpoint

        Faraday.new(options) do |builder|
          builder.use Faraday::Request::UrlEncoded
          builder.use Faraday::Response::Mashify
          builder.use Faraday::Response::ParseJson
          builder.adapter(:net_http)
        end
      end
    
  end
end