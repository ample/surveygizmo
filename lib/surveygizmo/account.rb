require 'surveygizmo/identity'
require 'surveygizmo/creatable'
require 'cgi'

module Surveygizmo
  class Account < Surveygizmo::Identity
    include Surveygizmo::Creatable
    attr_reader :organization, :contact_phone, :resellers_customer_id, :reseller_uuid

    def login_link
      @login_link ||= CGI.unescape(@attrs[:login_link]) unless @attrs[:login_link].nil?
    end

    def reseller
      @attrs[:reseller]
    end
  end
end