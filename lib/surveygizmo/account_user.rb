require 'time'
require 'surveygizmo/identity'

module Surveygizmo
  class AccountUser < Surveygizmo::Identity
    attr_reader :_type, :username, :email, :status

    # Time when the object was modified on Surveygizmo
    #
    # @return [Time]
    def last_login
      @last_login ||= Time.parse(@attrs[:last_login]) unless @attrs[:last_login].nil?
    end
  end
end