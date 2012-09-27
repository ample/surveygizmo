require 'helper'

describe Surveygizmo::API do
  let(:client){ Surveygizmo::Client.new }

  describe "#survey_campaigns" do
    before do
     stub_get("/v2/survey/1018301/surveycampaign").
       to_return(:body => fixture("survey_campaigns.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end

    subject(:survey_campaigns){ client.survey_campaigns(1018301) }

    it "requests the correct resource" do
      survey_campaigns
      a_get("/v2/survey/1018301/surveycampaign").
        should have_been_made
    end
    describe "SurveyCampaign Collection" do
      it{ survey_campaigns.should be_an Array }
      it{ survey_campaigns.first.should be_a Surveygizmo::SurveyCampaign }
      it{ survey_campaigns.first.id.should eq 673550 }
      it{ survey_campaigns.page.should eq 1 }
      it{ survey_campaigns.total_count.should eq 2 }
      it{ survey_campaigns.total_pages.should eq 1 }
      it{ survey_campaigns.results_per_page.should eq 50 }
    end
  end

  describe "#survey_campaign" do
    before do
     stub_get("/v2/survey/1018301/surveycampaign/673550").
       to_return(:body => fixture("survey_campaign.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end

    subject(:survey_campaign){ client.survey_campaign(1018301, 673550) }

    it "requests the correct resource" do
      survey_campaign
      a_get("/v2/survey/1018301/surveycampaign/673550").
        should have_been_made
    end

    describe "SurveyCampaign Object" do
      it{ survey_campaign.should be_a Surveygizmo::SurveyCampaign }
      it{ survey_campaign.id.should eq 673550 }
      it{ survey_campaign._type.should eq "SurveyCampaign" }
      it{ survey_campaign._subtype.should eq "link" }
      it{ survey_campaign.__subtype.should eq "standard" }
      it{ survey_campaign.status.should eq "Active" }
      it{ survey_campaign.name.should eq "Default Link" }
      it{ survey_campaign.SSL.should eq "False" }
      it{ survey_campaign.tokenvariables.should be_nil }
      it{ survey_campaign.limit_responses.should be_nil }
      it{ survey_campaign.close_message.should be_nil }
      it{ survey_campaign.language.should eq "Auto" }
      it{ survey_campaign.datecreated.should eq Time.parse("2012-09-03 23:39:26") }
      it{ survey_campaign.datemodified.should eq Time.parse("2012-09-03 23:39:26") }
    end
  end
end