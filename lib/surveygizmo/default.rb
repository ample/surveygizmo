require 'surveygizmo/configurable'

module Surveygizmo
  module Default
    ENDPOINT   = 'https://restapi.surveygizmo.com/v2/' unless defined? ENDPOINT
    USER_AGENT = "Surveygizmo Ruby Gem #{Surveygizmo::VERSION}" unless defined? USER_AGENT

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
    end
    
  end
end