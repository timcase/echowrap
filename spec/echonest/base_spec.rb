require 'helper'

describe Echowrap::Base do

  #context "identity map enabled" do
    #before do
      #Echowrap.identity_map = Echowrap::IdentityMap
      #object = Echowrap::Base.new(:id => 1)
      #@base = Echowrap::Base.store(object)
    #end

    #after do
      #Echowrap.identity_map = false
    #end

    #describe ".identity_map" do
      #it "returns an instance of the identity map" do
        #expect(Echowrap::Base.identity_map).to be_a Echowrap::IdentityMap
      #end
    #end

    #describe ".fetch" do
      #it "returns existing objects" do
        #expect(Echowrap::Base.fetch(:id => 1)).to be
      #end

      #it "raises an error on objects that don't exist" do
        #expect{Echowrap::Base.fetch(:id => 6)}.to raise_error Echowrap::Error::IdentityMapKeyError
      #end
    #end

    #describe ".store" do
      #it "stores Echowrap::Base objects" do
        #object = Echowrap::Base.new(:id => 4)
        #expect(Echowrap::Base.store(object)).to be_a Echowrap::Base
      #end
    #end

    #describe ".fetch_or_new" do
      #it "returns existing objects" do
        #expect(Echowrap::Base.fetch_or_new(:id => 1)).to be
      #end
      #it "creates new objects and stores them" do
        #expect(Echowrap::Base.fetch_or_new(:id => 2)).to be
        #expect(Echowrap::Base.fetch(:id => 2)).to be
      #end
    #end

    #describe "#[]" do
      #it "calls methods using [] with symbol" do
        #expect(@base[:object_id]).to be_an Integer
      #end
      #it "calls methods using [] with string" do
        #expect(@base['object_id']).to be_an Integer
      #end
      #it "returns nil for missing method" do
        #expect(@base[:foo]).to be_nil
        #expect(@base['foo']).to be_nil
      #end
    #end

    #describe "#to_hash" do
      #it "returns a hash" do
        #expect(@base.to_hash).to be_a Hash
        #expect(@base.to_hash[:id]).to eq 1
      #end
    #end

    #describe "identical objects" do
      #it "have the same object_id" do
        #expect(@base.object_id).to eq Echowrap::Base.fetch(:id => 1).object_id
      #end
    #end

  #end

  #context "identity map disabled" do

    #before(:all) do
      #Echowrap.identity_map = false
    #end

    #after(:all) do
      #Echowrap.identity_map = Echowrap::IdentityMap
    #end

    #describe ".identity_map" do
      #it "returns nil" do
        #expect(Echowrap::Base.identity_map).to be_nil
      #end
    #end

    #describe ".fetch" do
      #it "returns nil" do
        #expect(Echowrap::Base.fetch(:id => 1)).to be_nil
      #end
    #end

    #describe ".store" do
      #it "returns an instance of the object" do
        #expect(Echowrap::Base.store(Echowrap::Base.new(:id => 1))).to be_a Echowrap::Base
      #end
    #end

    #describe ".fetch_or_new" do
      #it "creates new objects" do
        #expect(Echowrap::Base.fetch_or_new(:id => 2)).to be
        #expect(Echowrap.identity_map).to be_false
      #end
    #end
  #end

  #describe '#attrs' do
    #it 'returns a hash of attributes' do
      #expect(Echowrap::Base.new(:id => 1).attrs).to eq({:id => 1})
    #end
  #end

end
