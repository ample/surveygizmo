module Surveygizmo
  module Configurable
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