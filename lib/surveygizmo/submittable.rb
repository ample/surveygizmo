require 'time'

module Surveygizmo
  module Submittable

    # Time when the object was modified on Surveygizmo
    #
    # @return [Time]
    def date_submitted
      @date_submitted ||= Time.parse(@attrs[:date_submitted]) unless @attrs[:date_submitted].nil?
    end
  end
end
