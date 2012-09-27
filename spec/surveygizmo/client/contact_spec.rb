require 'helper'

describe Surveygizmo::API do
  let(:client){ Surveygizmo::Client.new }
  subject(:contacts){ client.contacts(1018301, 673550) }

  describe "#contacts" do
    before do
     stub_get("/v2/survey/1018301/surveycampaign/673550/contact").
       to_return(:body => fixture("contacts.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests the correct resource" do
      contacts
      a_get("/v2/survey/1018301/surveycampaign/673550/contact").
        should have_been_made
    end

    describe "Contact Collection" do
      it{ contacts.should be_an Array }
      it{ contacts.first.should be_a Surveygizmo::Contact }
      it{ contacts.first.id.should eq 1 }
    end
  end

  describe "#contact" do
    before do
     stub_get("/v2/survey/1018301/surveycampaign/673550/contact/1").
       to_return(:body => fixture("contact.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end

    subject(:contact){ client.contact(1018301, 673550, 1) }

    it "requests the correct resource" do
      contact
      a_get("/v2/survey/1018301/surveycampaign/673550/contact/1").
        should have_been_made
    end

    describe "Contact object" do
      it{ contact.should be_a Surveygizmo::Contact }
      it{ contact.id.should eq 1 }
      it{ contact.semailaddress.should eq "allan@gmail.com" }
      it{ contact.sfirstname.should eq "Allan " }
      it{ contact.slastname.should eq "Something" }
      it{ contact.sorganization.should eq "" }
      it{ contact.sdepartment.should eq "" }
      it{ contact.shomephone.should eq "" }
      it{ contact.sfaxphone.should eq "" }
      it{ contact.sbusinessphone.should eq "" }
      it{ contact.smailingaddress.should eq "" }
      it{ contact.smailingaddress2.should eq "" }
      it{ contact.smailingaddresscity.should eq "" }
      it{ contact.smailingaddressstate.should eq "" }
      it{ contact.smailingaddresscountry.should eq "" }
      it{ contact.smailingaddresspostal.should eq "" }
      it{ contact.stitle.should eq "" }
      it{ contact.surl.should eq "" }
      it{ contact.scustomfield1.should eq "" }
      it{ contact.scustomfield2.should eq "" }
      it{ contact.scustomfield3.should eq "" }
      it{ contact.scustomfield4.should eq "" }
      it{ contact.scustomfield5.should eq "" }
      it{ contact.scustomfield6.should eq "" }
      it{ contact.scustomfield7.should eq "" }
      it{ contact.scustomfield8.should eq "" }
      it{ contact.scustomfield9.should eq "" }
      it{ contact.scustomfield10.should eq "" }
      it{ contact.estatus.should eq "Active" }
      it{ contact.esubscriberstatus.should eq "Sent" }
    end
  end
end