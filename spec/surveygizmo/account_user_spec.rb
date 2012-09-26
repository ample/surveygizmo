require 'helper'

describe Surveygizmo::AccountUser do
  attributes = {
    "_type"=>"AccountUser",
    "username"=>"Jon",
    "email"=>"jon@somewhere.com",
    "status"=>"Active"
  }

  attributes.each_pair do |attribute, value|
    attribute = attribute.to_sym
    describe "##{attribute}" do
      it "returns a String when #{attribute} is set" do
        account_user = Surveygizmo::AccountUser.new(:id => 183437, attribute => value)
        account_user.send(attribute).should eq value
      end
      it "returns nil when #{attribute} is not set" do
        account_user = Surveygizmo::AccountUser.new(:id => 183437)
        account_user.send(attribute).should be_nil
      end
    end
  end

  describe "#last_login" do
    it "returns a Time when last_login is set" do
      account_user = Surveygizmo::AccountUser.new(:id => 183437, :last_login => "2012-07-05 18:24:02")
      account_user.last_login.should eq Time.parse("2012-07-05 18:24:02")
    end
    it "returns nil when last_login is not set" do
      account_user = Surveygizmo::AccountUser.new(:id => 183437)
      account_user.last_login.should be_nil
    end
  end
end