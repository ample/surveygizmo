require 'helper'

describe Surveygizmo::Account do
  describe "#datecreated" do
    it "returns a Time when datecreated is set" do
      account = Surveygizmo::Account.new(:id => 1825786345, :datecreated => "Mon Jul 16 12:59:01 +0000 2007")
      account.datecreated.should be_a Time
    end
    it "returns nil when datecreated is not set" do
      account = Surveygizmo::Account.new(:id => 1825786345)
      account.datecreated.should be_nil
    end
  end

  describe "#created_at" do
    it "returns a Time when datecreated is set" do
      account = Surveygizmo::Account.new(:id => 1825786345, :datecreated => "Mon Jul 16 12:59:01 +0000 2007")
      account.created_at.should be_a Time
    end
    it "returns nil when date_created is not set" do
      account = Surveygizmo::Account.new(:id => 1825786345)
      account.created_at.should be_nil
    end
  end

  describe "#organization" do
    it "returns a String when organization is set" do
      account = Surveygizmo::Account.new(:id => 1825786345, :organization => "Surveygizmo")
      account.organization.should eq "Surveygizmo"
    end
    it "returns nil when organization is not set" do
      account = Surveygizmo::Account.new(:id => 7505382)
      account.organization.should be_nil
    end
  end

  describe "#contact_phone" do
    it "returns a String when contact_phone is set" do
      account = Surveygizmo::Account.new(:id => 1825786345, :contact_phone => "2065555455")
      account.contact_phone.should eq "2065555455"
    end
    it "returns nil when contact_phone is not set" do
      account = Surveygizmo::Account.new(:id => 7505382)
      account.contact_phone.should be_nil
    end
  end

  describe "#login_link" do
    it "returns a String when login_link is set" do
      account = Surveygizmo::Account.new(:id => 1825786345, :login_link => "https:\/\/appv3.sgizmo.com\/login\/v1?authenticate=20743223994f21c0cc96c9e2de0455d2c545c470&account_user_id=2894&signature=abcdef")
      account.login_link.should eq "https://appv3.sgizmo.com/login/v1?authenticate=20743223994f21c0cc96c9e2de0455d2c545c470&account_user_id=2894&signature=abcdef"
    end
    it "returns nil when login_link is not set" do
      account = Surveygizmo::Account.new(:id => 7505382)
      account.login_link.should be_nil
    end
  end

  describe "#reseller" do
    it "returns a String when reseller is set to true" do
      account = Surveygizmo::Account.new(:id => 1825786345, :reseller => true)
      account.reseller.should be_true
    end
    it "returns a String when reseller is set to false" do
      account = Surveygizmo::Account.new(:id => 1825786345, :reseller => false)
      account.reseller.should be_false
    end
    it "returns false when reseller is not set" do
      account = Surveygizmo::Account.new(:id => 7505382)
      account.reseller.should be_false
    end
  end

  describe "#resellers_customer_id" do
    it "returns a Integer when resellers_customer_id is set" do
      account = Surveygizmo::Account.new(:id => 1825786345, :resellers_customer_id => 374927)
      account.resellers_customer_id.should eq 374927
    end
    it "returns nil when resellers_customer_id is not set" do
      account = Surveygizmo::Account.new(:id => 7505382)
      account.resellers_customer_id.should be_nil
    end
  end

  describe "#reseller_uuid" do
    it "returns a Integer when reseller_uuid is set" do
      account = Surveygizmo::Account.new(:id => 1825786345, :reseller_uuid => "abc123xyz")
      account.reseller_uuid.should eq "abc123xyz"
    end
    it "returns nil when contact_phone is not set" do
      account = Surveygizmo::Account.new(:id => 7505382)
      account.reseller_uuid.should be_nil
    end
  end
end