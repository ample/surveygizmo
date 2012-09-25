require 'helper'

describe Surveygizmo::SurveyCampaign do
  describe "#date_created" do
    it "returns a Time when date_created is set" do
      survey_campaign = Surveygizmo::SurveyCampaign.new(:id => 673550, :datecreated => "Mon Jul 16 12:59:01 +0000 2007")
      survey_campaign.datecreated.should be_a Time
    end
    it "returns nil when date_created is not set" do
      survey_campaign = Surveygizmo::SurveyCampaign.new(:id => 673550)
      survey_campaign.datecreated.should be_nil
    end
  end

  describe "#datemodified" do
    it "returns a Time when date_modified is set" do
      survey_campaign = Surveygizmo::SurveyCampaign.new(:id => 673550, :datemodified => "Mon Jul 16 12:59:01 +0000 2007")
      survey_campaign.datemodified.should be_a Time
    end
    it "returns nil when date_modified is not set" do
      survey_campaign = Surveygizmo::SurveyCampaign.new(:id => 673550)
      survey_campaign.datemodified.should be_nil
    end
  end

  describe "#_type" do
    it "returns a String when _type is set" do
      survey_campaign = Surveygizmo::SurveyCampaign.new(:id => 673550, :_type => "SurveyCampaign")
      survey_campaign._type.should eq "SurveyCampaign"
    end
    it "returns nil when _type is not set" do
      survey_campaign = Surveygizmo::SurveyCampaign.new(:id => 673550)
      survey_campaign._type.should be_nil
    end
  end

  describe "#_subtype" do
    it "returns a String when _subtype is set" do
      survey_campaign = Surveygizmo::SurveyCampaign.new(:id => 673550, :_subtype => "link")
      survey_campaign._subtype.should eq "link"
    end
    it "returns nil when _subtype is not set" do
      survey_campaign = Surveygizmo::SurveyCampaign.new(:id => 673550)
      survey_campaign._subtype.should be_nil
    end
  end

  describe "#__subtype" do
    it "returns a String when __subtype is set" do
      survey_campaign = Surveygizmo::SurveyCampaign.new(:id => 673550, :__subtype => "standard")
      survey_campaign.__subtype.should eq "standard"
    end
    it "returns nil when __subtype is not set" do
      survey_campaign = Surveygizmo::SurveyCampaign.new(:id => 673550)
      survey_campaign.__subtype.should be_nil
    end
  end

  describe "#status" do
    it "returns a String when status is set" do
      survey_campaign = Surveygizmo::SurveyCampaign.new(:id => 673550, :status => "Active")
      survey_campaign.status.should eq "Active"
    end
    it "returns nil when status is not set" do
      survey_campaign = Surveygizmo::SurveyCampaign.new(:id => 673550)
      survey_campaign.status.should be_nil
    end
  end

  describe "#name" do
    it "returns a String when name is set" do
      survey_campaign = Surveygizmo::SurveyCampaign.new(:id => 673550, :name => "Default Link")
      survey_campaign.name.should eq "Default Link"
    end
    it "returns nil when name is not set" do
      survey_campaign = Surveygizmo::SurveyCampaign.new(:id => 673550)
      survey_campaign.name.should be_nil
    end
  end

    # "uri":"www.surveygizmo.com\/s3\/1018301\/Movie-Rating",

  describe "#SSL" do
    it "returns a String when SSL is set to 'False'" do
      survey_campaign = Surveygizmo::SurveyCampaign.new(:id => 673550, :SSL => "False")
      survey_campaign.SSL.should eq "False"
    end
    it "returns a String when SSL is set to 'True'" do
      survey_campaign = Surveygizmo::SurveyCampaign.new(:id => 673550, :SSL => "True")
      survey_campaign.SSL.should eq "True"
    end
    it "returns nil when SSL is not set" do
      survey_campaign = Surveygizmo::SurveyCampaign.new(:id => 673550)
      survey_campaign.SSL.should be_nil
    end
  end

  describe "#tokenvariables" do
    it "returns a String when tokenvariables is set" do
      survey_campaign = Surveygizmo::SurveyCampaign.new(:id => 673550, :tokenvariables => "hello=world&name=jack")
      survey_campaign.tokenvariables.should eq "hello=world&name=jack"
    end
    it "returns nil when tokenvariables is not set" do
      survey_campaign = Surveygizmo::SurveyCampaign.new(:id => 673550)
      survey_campaign.tokenvariables.should be_nil
    end
  end

  describe "#limit_responses" do
    it "returns a String when limit_responses is set" do
      survey_campaign = Surveygizmo::SurveyCampaign.new(:id => 673550, :limit_responses => "50")
      survey_campaign.limit_responses.should eq "50"
    end
    it "returns nil when limit_responses is not set" do
      survey_campaign = Surveygizmo::SurveyCampaign.new(:id => 673550)
      survey_campaign.limit_responses.should be_nil
    end
  end

  describe "#close_message" do
    it "returns a String when close_message is set" do
      survey_campaign = Surveygizmo::SurveyCampaign.new(:id => 673550, :close_message => "This survey is now closed.")
      survey_campaign.close_message.should eq "This survey is now closed."
    end
    it "returns nil when close_message is not set" do
      survey_campaign = Surveygizmo::SurveyCampaign.new(:id => 673550)
      survey_campaign.close_message.should be_nil
    end
  end

  describe "#language" do
    it "returns a String when language is set" do
      survey_campaign = Surveygizmo::SurveyCampaign.new(:id => 673550, :language => "Auto")
      survey_campaign.language.should eq "Auto"
    end
    it "returns nil when language is not set" do
      survey_campaign = Surveygizmo::SurveyCampaign.new(:id => 673550)
      survey_campaign.language.should be_nil
    end
  end
end