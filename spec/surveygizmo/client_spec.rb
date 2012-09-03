require 'helper'

describe Surveygizmo::Client do
  subject do
    Surveygizmo::Client.new(
      :username => "steven@somewhere.org",
      :password => "keyboardcat"
    )
  end

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

  describe "#auth_query_hash" do
    it "creates the correct auth query params" do
      authorization = subject.send(:auth_query_hash)
      authorization[:'user:md5'].should eq "steven@somewhere.org:39f8d5313141b1f2bade311ba571537e"
    end
  end
end
