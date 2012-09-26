module Surveygizmo
  class Error < StandardError
    # @return [Hash]
    def self.errors
      @errors ||= Hash[descendants.map{|klass| [klass.const_get(:ERROR_CODE), klass]}]
    end

    # @return [Array]
    def self.descendants
      ObjectSpace.each_object(::Class).select{|klass| klass < self}
    end
    
    def initialize(exception=$!, response_headers={})
      super(exception.to_s)
    end
  end
end
