require 'helper'

describe Surveygizmo do
  after do
    Surveygizmo.reset!
  end

  context "when delegating to a client" do

    before do
      stub_get("/v2/account").
        to_return(:body => fixture("account.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests the correct resource" do
      Surveygizmo.account
      a_get("/v2/account").
        should have_been_made
    end

    it "returns the same results as a client" do
      Surveygizmo.account.should eq Surveygizmo::Client.new.account
    end
  end

  describe '.respond_to?' do
    it "delegates to Surveygizmo::Client" do
      Surveygizmo.respond_to?(:account).should be_true
    end
    it "takes an optional argument" do
      Surveygizmo.respond_to?(:account, true).should be_true
    end
  end
end