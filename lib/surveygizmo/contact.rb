require 'surveygizmo/identity'

module Surveygizmo
  class Contact < Surveygizmo::Identity
    attr_reader :semailaddress, :sfirstname, :slastname, :sorganization, 
      :sdepartment, :shomephone, :sfaxphone, :sbusinessphone, 
      :smailingaddress, :smailingaddress2, :smailingaddresscity, 
      :smailingaddressstate, :smailingaddresscountry, 
      :smailingaddresspostal, :stitle, :surl, :scustomfield1, 
      :scustomfield2, :scustomfield3, :scustomfield4, 
      :scustomfield5, :scustomfield6, :scustomfield7, 
      :scustomfield8, :scustomfield9, :scustomfield10, 
      :estatus, :esubscriberstatus
  end
end