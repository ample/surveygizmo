module Surveygizmo
  IDENTITY_MAP = Surveygizmo::IdentityMap unless defined? IDENTITY_MAP
  class << self
    # @return [Surveygizmo::IdentityMap]
    def identity_map
      IDENTITY_MAP
    end
  end
end