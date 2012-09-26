require 'helper'

describe Surveygizmo::Contact do
  attributes = {
    "semailaddress"=>"allan@gmail.com",
    "sfirstname"=>"Allan ",
    "slastname"=>"Something",
    "sorganization"=>"",
    "sdepartment"=>"",
    "shomephone"=>"",
    "sfaxphone"=>"",
    "sbusinessphone"=>"",
    "smailingaddress"=>"",
    "smailingaddress2"=>"",
    "smailingaddresscity"=>"",
    "smailingaddressstate"=>"",
    "smailingaddresscountry"=>"",
    "smailingaddresspostal"=>"",
    "stitle"=>"",
    "surl"=>"",
    "scustomfield1"=>"",
    "scustomfield2"=>"",
    "scustomfield3"=>"",
    "scustomfield4"=>"",
    "scustomfield5"=>"",
    "scustomfield6"=>"",
    "scustomfield7"=>"",
    "scustomfield8"=>"",
    "scustomfield9"=>"",
    "scustomfield10"=>"",
    "estatus"=>"Active",
    "esubscriberstatus"=>"Sent"
  }

  attributes.each_pair do |attribute, value|
    attribute = attribute.to_sym
    describe "##{attribute}" do
      it "returns a String when #{attribute} is set" do
        survey_campaign = Surveygizmo::Contact.new(:id => 673550, attribute => value)
        survey_campaign.send(attribute).should eq value
      end
      it "returns nil when #{attribute} is not set" do
        survey_campaign = Surveygizmo::Contact.new(:id => 673550)
        survey_campaign.send(attribute).should be_nil
      end
    end
  end
end