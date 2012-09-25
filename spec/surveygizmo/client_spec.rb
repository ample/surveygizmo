require 'helper'

describe Surveygizmo::Client do
  subject do
    Surveygizmo::Client.new(
      :username => "steven@somewhere.org",
      :password => "keyboardcat"
    )
  end

  context "with module configuration" do
    before do
      Surveygizmo.configure do |config|
        Surveygizmo::Configurable.keys.each do |key|
          config.send("#{key}=", key)
        end
      end
    end

    after do
      Surveygizmo.reset!
    end

    it "inherits the module configuration" do
      client = Surveygizmo::Client.new
      Surveygizmo::Configurable.keys.each do |key|
        client.instance_variable_get(:"@#{key}").should eq key
      end
    end
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

  context "authenticating requests" do
    subject do
      Surveygizmo::Client.new(:username => "steven@somewhere.org", :password => "keyboardcat")
    end
    before do
     authorization = subject.send(:auth_query_hash)
     stub_get("/v2/account").
       with(:query => authorization).
       to_return(:body => fixture("account.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end
    it "includes authorization in request query hash" do
      subject.account
      a_get("/v2/account").
        with(:query => {:'user:md5' => "steven@somewhere.org:39f8d5313141b1f2bade311ba571537e"}).
        should have_been_made
    end
  end
end
