require 'surveygizmo/default'

module Surveygizmo
  module Configurable
    attr_writer :username, :password
    attr_accessor :endpoint, :user_agent, :connection_options, :middleware

    class << self
      def keys
        @keys ||= [
          :username,
          :password,
          :endpoint,
          :user_agent,
          :connection_options,
          :middleware
        ]
      end
    end

    def configure
      yield self
    end

    # @return [Boolean]
    def credentials?
      credentials.values.all?
    end

    def reset!
      Surveygizmo::Configurable.keys.each do |key|
        instance_variable_set(:"@#{key}", Surveygizmo::Default.options[key])
      end
      self
    end
    alias setup reset!

    private

    # @return [Hash]
    def credentials
      {
        :username => @username,
        :password => @password
      }
    end
  end
end