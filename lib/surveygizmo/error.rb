module Surveygizmo
  class Error < StandardError
    attr_reader :code
    # @return [Hash]
    def self.errors
      @errors ||= Hash[descendants.map{|klass| [klass.const_get(:ERROR_CODE), klass]}]
    end

    # @return [Array]
    def self.descendants
      ObjectSpace.each_object(::Class).select{|klass| klass < self}
    end
    
    def initialize(code=$!, exception=$!, response_headers={})
      @code = code
      super(exception.to_s)
    end
  end
end
