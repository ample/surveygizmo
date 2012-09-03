require 'helper'

describe Surveygizmo::Client do
  describe "#credentials?" do
    it "returns true if all credentials are present" do
      client = Surveygizmo::Client.new(:username => "steven@somewhere.org", :password => "keyboardcat") 
      client.credentials?.should be_true
    end
    it "returns false if any credentials are missing" do
      client = Surveygizmo::Client.new(:username => "steven@somewhere.org")
      client.credentials?.should be_false
    end
  end
end
