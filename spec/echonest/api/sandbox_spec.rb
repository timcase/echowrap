require 'helper'

describe Echowrap::API::Sandbox do
  before do
    @client = new_test_client
  end

  describe "#sandbox_list" do

   before do
     stub_get("/api/v4/sandbox/list").
     with(:query => {:sandbox => 'emi_evanescence'}).
     to_return(:body => fixture("sandbox/list.json"),
                :headers => {:content_type => "application/json; charset=utf-8"})
   end

   it "requests the correct resource" do
     @client.sandbox_list(:sandbox => "emi_evanescence")
     expect(a_get("/api/v4/sandbox/list").
     with(:query => {:sandbox => 'emi_evanescence'})).
     to have_been_made
   end

   it "returns a sandbox" do
     sandbox = @client.sandbox_list(:sandbox => "emi_evanescence")
     expect(sandbox).to be_a Echowrap::Sandbox
     expect(sandbox.total).to eq 455
   end

   it "returns assets with the sandbox" do
     sandbox = @client.sandbox_list(:sandbox => "emi_evanescence")
     expect(sandbox.assets).to be_an Array
     expect(sandbox.assets.first.id).to eq '2d2b8d352d6f2bc8297266117116421d'
   end

   it "returns echonest_ids with the assets with the sandbox" do
     sandbox = @client.sandbox_list(:sandbox => "emi_evanescence")
     expect(sandbox.assets.last.echonest_ids).to be_an Array
     expect(sandbox.assets.last.echonest_ids.first.id).to eq 'TRFQBKY133B7EA9267'
   end
  end

  describe "#sandbox_access" do

   before do
     @client = Echowrap::Client.new(:api_key => "AK", :consumer_key => "CK", :shared_secret => "SS")
     stub_get("/api/v4/sandbox/access", false).
     with(:query => hash_including({:sandbox => 'emi_evanescence', :id => '2d2b8d352d6f2bc8297266117116421d'})).
     to_return(:body => fixture("sandbox/access.json"),
                :headers => {:content_type => "application/json; charset=utf-8"})
   end

   it "requests the correct resource" do
     @client.sandbox_access(:sandbox => "emi_evanescence", :id => '2d2b8d352d6f2bc8297266117116421d')
     expect(a_get("/api/v4/sandbox/access", false).
     with(:query => hash_including({:sandbox => 'emi_evanescence', :id => '2d2b8d352d6f2bc8297266117116421d'}))).
     to have_been_made
   end

   it "returns assets with the sandbox" do
     assets = @client.sandbox_access(:sandbox => "emi_evanescence", :id => '2d2b8d352d6f2bc8297266117116421d')
     expect(assets).to be_an Array
     expect(assets.first.id).to eq 'c1b89c9b9e0ee9e53650f1d4e393d716'
   end

  end
end
