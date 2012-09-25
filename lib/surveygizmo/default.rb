require 'surveygizmo/configurable'
require 'faraday_middleware'
require 'surveygizmo/identity_map'
require 'surveygizmo/response/parse_json'

module Surveygizmo
  module Default
    ENDPOINT   = 'https://restapi.surveygizmo.com/v2/' unless defined? ENDPOINT
    USER_AGENT = "Surveygizmo Ruby Gem #{Surveygizmo::VERSION}" unless defined? USER_AGENT
    IDENTITY_MAP = Surveygizmo::IdentityMap unless defined? IDENTITY_MAP
    CONNECTION_OPTIONS = {
      :headers => { 
        :accept => 'application/json', 
        :user_agent => USER_AGENT },
      :ssl => { :verify => false }
    } unless defined? CONNECTION_OPTIONS
    MIDDLEWARE = Faraday::Builder.new(
      &Proc.new do |builder|
        # Convert request params to "www-form-urlencoded"
        builder.use Faraday::Request::UrlEncoded
        # Parse JSON response bodies using MultiJson
        builder.use Surveygizmo::Response::ParseJson
        # Set Faraday's HTTP adapter
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

      # @return [Surveygizmo::IdentityMap]
      def identity_map
        IDENTITY_MAP
      end
    end
    
  end
end