require 'helper'

describe Surveygizmo::API do
  before do
    @client = Surveygizmo::Client.new
  end

  describe "#account" do
    before do
     stub_get("/v2/account").
       to_return(:body => fixture("account.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end
    it "requests the correct resource" do
      @client.account
      a_get("/v2/account").
        should have_been_made
    end
    it "returns the account" do
      account = @client.account
      account.should be_a Surveygizmo::Account
      account.id.should eq 57382
    end
  end
end