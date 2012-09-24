require 'surveygizmo/configurable'
require 'surveygizmo/identity_map'

module Surveygizmo
  module Default
    ENDPOINT   = 'https://restapi.surveygizmo.com/v2/'
    USER_AGENT = "Surveygizmo Ruby Gem #{Surveygizmo::VERSION}"
    IDENTITY_MAP = Surveygizmo::IdentityMap unless defined? IDENTITY_MAP
    
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

      # @return [Surveygizmo::IdentityMap]
      def identity_map
        IDENTITY_MAP
      end
    end
  end
end