require 'helper'

describe Surveygizmo::API do
  let(:client) { Surveygizmo::Client.new }

  describe "#contacts" do
    before do
     stub_get("/v2/survey/1018301/surveycampaign/673550/contact").
       to_return(:body => fixture("contacts.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end
    it "requests the correct resource" do
      client.contacts(1018301, 673550)
      a_get("/v2/survey/1018301/surveycampaign/673550/contact").
        should have_been_made
    end
  end

  describe "#contact" do
    before do
     stub_get("/v2/survey/1018301/surveycampaign/673550/contact/1").
       to_return(:body => fixture("contact.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end
    it "requests the correct resource" do
      client.contact(1018301, 673550, 1)
      a_get("/v2/survey/1018301/surveycampaign/673550/contact/1").
        should have_been_made
    end
  end
end
