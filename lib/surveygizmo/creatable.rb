require 'time'

module Surveygizmo
  module Creatable

    # Time when the object was created on Surveygizmo
    #
    # @return [Time]
    def datecreated
      @datecreated ||= Time.parse(@attrs[:datecreated]) unless @attrs[:datecreated].nil?
    end

    alias :created_at :datecreated

  end
end
