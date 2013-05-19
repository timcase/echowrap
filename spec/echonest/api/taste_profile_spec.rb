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
end
