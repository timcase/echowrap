require 'helper'

describe Echonest::API::TasteProfile do

  before do
    @client = Echonest::Client.new(:api_key => "AK")
  end

  describe "#taste_profile_create" do

    before do
      stub_post("/api/v4/catalog/create").
      with(:body => {:api_key => 'AK', :name => "Favorite Artists of Paul", :type => 'artist'}).
      to_return(:body => fixture("taste_profile/create.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests the correct resource" do
      @client.taste_profile_create(:api_key => 'AK', :name => "Favorite Artists of Paul", :type => 'artist')
      expect(a_post("/api/v4/catalog/create").
      with(:body => {:api_key => 'AK', :name => "Favorite Artists of Paul", :type => 'artist'})).
      to have_been_made
    end

    it "returns a taste profile" do
      taste_profile = @client.taste_profile_create(:api_key => 'AK', :name => "Favorite Artists of Paul", :type => 'artist')
      expect(taste_profile).to be_a Echonest::TasteProfile
      expect(taste_profile.id).to eq 'CAUWCTB13EBA18ADAE'
    end
  end

  #describe "#taste_profile_update" do

    #before do
      #stub_post("/api/v4/catalog/update").
      #with(:body => {:api_key => 'AK', :id => 'CAUWCTB13EBA18ADAE', :data_type => "json", :data => fixture('taste_profile/update_request_data.json').read}).
      #to_return(:body => fixture("taste_profile/update.json"),
                 #:headers => {:content_type => "application/json; charset=utf-8"})
    #end

    #it "requests the correct resource" do
      #@client.taste_profile_update(:api_key => 'AK', :id => 'CAUWCTB13EBA18ADAE', :data => fixture('taste_profile/update_request_data.json').read)
      #expect(a_post("/api/v4/catalog/update").
      #with(:body => {:api_key => 'AK', :data_type => "json", :id => 'CAUWCTB13EBA18ADAE', :data => fixture('taste_profile/update_request_data.json').read})).
      #to have_been_made
    #end

    #it "returns a taste profile" do
      #taste_profile = @client.taste_profile_update(:api_key => 'AK', :id => 'CAUWCTB13EBA18ADAE', :data => fixture('taste_profile/update_request_data.json').read)
      #expect(taste_profile).to be_a Echonest::TasteProfile
      #expect(taste_profile.id).to eq 'd298131d5f189c73bd9a8ff706621443'
    #end
  #end

  describe "#taste_profile_keyvalues" do

    before do
      stub_post("/api/v4/catalog/keyvalues").
      with(:body => {:api_key => 'AK', :id => 'CAUWCTB13EBA18ADAE'}).
      to_return(:body => fixture("taste_profile/keyvalues.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests the correct resource" do
      @client.taste_profile_keyvalues(:api_key => 'AK', :id => 'CAUWCTB13EBA18ADAE')
      expect(a_post("/api/v4/catalog/keyvalues").
      with(:body => {:api_key => 'AK', :id => 'CAUWCTB13EBA18ADAE'})).
      to have_been_made
    end

    it "returns a taste profile" do
      taste_profile = @client.taste_profile_keyvalues(:api_key => 'AK', :id => 'CAUWCTB13EBA18ADAE')
      expect(taste_profile).to be_a Echonest::TasteProfile
      expect(taste_profile.keyvalues.cat_type).to eq 'persona'
    end
  end
end
