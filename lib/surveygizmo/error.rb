module Surveygizmo
  class Error < Exception
    attr_reader :code

    def initialize code, message
      @code  = code
      @message = message
    end

    def to_s
      "Surveygizmo error! (#{@code}) #{@message}"
    end
  end
end
