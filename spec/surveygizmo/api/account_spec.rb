require 'helper'

describe Surveygizmo::API do
  before do
    @client = Surveygizmo::Client.new(
      :username => "steven@somewhere.org",
      :password => "keyboardcat"
    )
  end

  describe "#account" do
    before do
     stub_get("/v1/account").
       with(:query => {:"user:md5" => "steven@somewhere.org:39f8d5313141b1f2bade311ba571537e"}).
       to_return(:body => fixture("account.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end
    it "requests the correct resource" do
      @client.account
      a_get("/v1/account").
        with(:query => {:"user:md5" => "steven@somewhere.org:39f8d5313141b1f2bade311ba571537e"}).
        should have_been_made
    end
  end
end