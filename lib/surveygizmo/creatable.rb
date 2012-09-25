require 'time'

module Surveygizmo
  module Creatable

    # Time when the object was created on Surveygizmo
    #
    # @return [Time]
    def date_created
      @date_created ||= Time.parse(@attrs[:date_created]) unless @attrs[:date_created].nil?
    end

    alias :created_at :date_created

  end
end
