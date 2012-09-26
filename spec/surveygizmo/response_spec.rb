require 'helper'

describe Surveygizmo::Response do
  context "#data" do
    it "is equal to the response object" do
      response.data.to_a == response.to_a
    end
  end
  
  context "#success?" do
    it "indicates the status of the response" do
      response.success?.should == true
    end
  end
  
end
