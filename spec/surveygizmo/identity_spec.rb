require 'helper'

describe Surveygizmo::Identity do
  context "Integer Id" do
    subject(:identity){ Surveygizmo::Identity.new(:id => 543) }
    it{ identity.id.should be_an Integer }
    it{ identity.id.should eq 543 }
  end

  context "String Id" do
    subject(:identity){ Surveygizmo::Identity.new(:id => "[question(3)]") }
    it{ identity.id.should be_an String }
    it{ identity.id.should eq "[question(3)]" }
  end
end