require 'helper'

# describe Echonest::Identity do

  # describe "#initialize" do
  #   it "raises an ArgumentError when type is not specified" do
  #     expect{Echonest::Identity.new}.to raise_error ArgumentError
  #   end
  # end
  # 
  # context "identity map enabled" do
  #   before do
  #     Echonest.identity_map = Echonest::IdentityMap
  #   end
  # 
  #   after do
  #     Echonest.identity_map = false
  #   end
  # 
  #   describe ".fetch" do
  #     it "returns existing objects" do
  #       Echonest::Identity.store(Echonest::Identity.new(:id => 1))
  #       expect(Echonest::Identity.fetch(:id => 1)).to be
  #     end
  # 
  #     it "raises an error on objects that don't exist" do
  #       expect{Echonest::Identity.fetch(:id => 6)}.to raise_error Echonest::Error::IdentityMapKeyError
  #     end
  #   end
  # end
  # 
  # describe "#==" do
  #   it "returns true when objects IDs are the same" do
  #     one = Echonest::Identity.new(:id => 1, :artist_name => "dtenaglia")
  #     two = Echonest::Identity.new(:id => 1, :artist_name => "rhawtin")
  #     expect(one == two).to be_true
  #   end
  #   it "returns false when objects IDs are different" do
  #     one = Echonest::Identity.new(:id => 1)
  #     two = Echonest::Identity.new(:id => 2)
  #     expect(one == two).to be_false
  #   end
  #   it "returns false when classes are different" do
  #     one = Echonest::Identity.new(:id => 1)
  #     two = Echonest::Base.new(:id => 1)
  #     expect(one == two).to be_false
  #   end
  # end
  # 
# end
