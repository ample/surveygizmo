require 'helper'

describe Surveygizmo::Base do

  context 'identity map enabled' do
    before do
      object = Surveygizmo::Base.new(:id => 1)
      @base = Surveygizmo::Base.store(object)
    end

    describe '.identity_map' do
      it 'returns an instance of the identity map' do
        Surveygizmo::Base.identity_map.should be_a Surveygizmo::IdentityMap
      end
    end

    describe '.fetch' do
      it 'returns existing objects' do
        Surveygizmo::Base.fetch(:id => 1).should be
      end

      it "raises an error on objects that don't exist" do
        lambda {
          Surveygizmo::Base.fetch(:id => 6)
        }.should raise_error(Surveygizmo::Error::IdentityMapKeyError)
      end
    end

    describe '.store' do
      it 'stores Surveygizmo::Base objects' do
        object = Surveygizmo::Base.new(:id => 4)
        Surveygizmo::Base.store(object).should be_a Surveygizmo::Base
      end
    end

    describe '.fetch_or_new' do
      it 'returns existing objects' do
        Surveygizmo::Base.fetch_or_new(:id => 1).should be
      end
      it 'creates new objects and stores them' do
        Surveygizmo::Base.fetch_or_new(:id => 2).should be
        Surveygizmo::Base.fetch(:id => 2).should be
      end
    end

    describe "#[]" do
      it "calls methods using [] with symbol" do
        @base[:object_id].should be_an Integer
      end
      it "calls methods using [] with string" do
        @base['object_id'].should be_an Integer
      end
      it "returns nil for missing method" do
        @base[:foo].should be_nil
        @base['foo'].should be_nil
      end
    end

    describe "#to_hash" do
      it "returns a hash" do
        @base.to_hash.should be_a Hash
        @base.to_hash[:id].should eq 1
      end
    end

    describe "identical objects" do
      it "have the same object_id" do
        @base.object_id.should eq Surveygizmo::Base.fetch(:id => 1).object_id
      end
    end

  end

  context 'identity map disabled' do
    before(:all) do
      Surveygizmo.identity_map = false
    end
    after(:all) do
      Surveygizmo.identity_map = Surveygizmo::IdentityMap
    end

    describe '.identity_map' do
      it 'returns nil' do
        Surveygizmo::Base.identity_map.should be_nil
      end
    end

    describe '.fetch' do
      it 'returns nil' do
        Surveygizmo::Base.fetch(:id => 1).should be_nil
      end
    end

    describe '.store' do
      it 'returns an instance of the object' do
        Surveygizmo::Base.store(Surveygizmo::Base.new(:id => 1)).should be_a Surveygizmo::Base
      end
    end

    describe '.fetch_or_new' do
      it 'creates new objects' do
        Surveygizmo::Base.fetch_or_new(:id => 2).should be
        Surveygizmo.identity_map.should be_false
      end
    end
  end

  context 'custom identity map enabled' do
    after(:all) do
      Surveygizmo.identity_map = Surveygizmo::IdentityMap
    end

    describe '.identity_map' do
      it 'returns an instance of the custom identity map' do
        Surveygizmo::Base.identity_map.should be_a Surveygizmo::IdentityMap
        Surveygizmo.identity_map = Hash
        Surveygizmo::Base.identity_map.should_not be_a Surveygizmo::IdentityMap
      end
    end
  end

end
