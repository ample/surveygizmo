require 'surveygizmo/configurable'
require 'faraday_middleware'

module Surveygizmo
  module Default
    ENDPOINT   = 'https://restapi.surveygizmo.com/v2/' unless defined? ENDPOINT
    USER_AGENT = "Surveygizmo Ruby Gem #{Surveygizmo::VERSION}" unless defined? USER_AGENT
    CONNECTION_OPTIONS = {
      :headers => { 
        :accept => 'application/json', 
        :user_agent => USER_AGENT },
      :ssl => { :verify => false }
    } unless defined? CONNECTION_OPTIONS
    MIDDLEWARE = Faraday::Builder.new(
      &Proc.new do |builder|
        builder.use Faraday::Request::UrlEncoded
        builder.use Faraday::Response::Mashify
        builder.use Faraday::Response::ParseJson
        builder.adapter(:net_http)
      end
    )

    class << self
      def options
        Hash[Surveygizmo::Configurable.keys.map{|key| [key, send(key)]}]
      end

      def username
        ENV['SURVEYGIZMO_USERNAME']
      end

      def password
        ENV['SURVEYGIZMO_PASSWORD']
      end

      def endpoint
        ENDPOINT
      end

      def user_agent
        USER_AGENT
      end

      def connection_options
        CONNECTION_OPTIONS
      end

      def middleware
        MIDDLEWARE
      end
    end
    
  end
end