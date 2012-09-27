require 'helper'

describe Surveygizmo::API do
  let(:client){ Surveygizmo::Client.new }

  describe "#account" do
    before do
     stub_get("/v2/account").
       to_return(:body => fixture("account.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end

    subject(:account){ client.account }

    it "requests the correct resource" do
      account
      a_get("/v2/account").
        should have_been_made
    end

    describe "Account Object" do
      it{ account.should be_a Surveygizmo::Account }
      it{ account.id.should eq 57382 }
      it{ account.organization.should eq "Surveygizmo" }
      it{ account.contact_phone.should eq "2065555455" }
      it{ account.reseller.should be_false }
      it{ account.reseller_uuid.should be_nil }
      it{ account.datecreated.should eq Time.parse("2011-10-05T15:26:36-04:00") }
      it{ account.date_created.should eq Time.parse("2011-10-05T15:26:36-04:00") }
      it{ account.created_at.should eq Time.parse("2011-10-05T15:26:36-04:00") }
      it{ account.login_link.should eq "https://appv3.sgizmo.com/login/v1?authenticate=20743223994f21c0cc96c9e2de0455d2c545c470&account_user_id=2894&signature=abcdef" }
    end
  end
end