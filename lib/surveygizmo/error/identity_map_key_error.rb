require 'surveygizmo/error'

module Surveygizmo
  class Error
    # Inherit from KeyError when Ruby 1.8 compatibility is removed
    class IdentityMapKeyError < ::IndexError
    end
  end
end
