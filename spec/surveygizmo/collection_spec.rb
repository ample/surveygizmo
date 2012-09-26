require 'helper'

describe Surveygizmo::Collection do
  subject(:collection){ 
    Surveygizmo::Collection.new(
      Surveygizmo::Account,
      {
        :total_count => "5",
        :page => "4",
        :total_pages => "3",
        :results_per_page => "5",
        :data => [{:id => 10}, {:id => 11}]
      }
    )
  }

  it{ collection.total_count.should eq 5}
  it{ collection.page.should eq 4}
  it{ collection.total_pages.should eq 3 }
  it{ collection.results_per_page.should eq 5 }
  it{ collection.first.should be_a Surveygizmo::Account}
  it "should be an array of Surveygizmo::Account" do
    collection.should eq [
      Surveygizmo::Account.new(:id => 10),
      Surveygizmo::Account.new(:id => 11)
    ]
  end
end
