module Surveygizmo
  module Configurable
    class << self
      def keys
        @keys ||= [
          :username,
          :password
        ]
      end
    end

    # @return [Boolean]
    def credentials?
      credentials.values.all?
    end

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