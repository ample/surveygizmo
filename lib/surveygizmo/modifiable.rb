require 'time'

module Surveygizmo
  module Modifiable

    # Time when the object was modified on Surveygizmo
    #
    # @return [Time]
    def datemodified
      @datemodified ||= Time.parse(@attrs[:datemodified]) unless @attrs[:datemodified].nil?
    end

    alias :updated_on :datemodified
    alias :date_modified :datemodified

  end
end
