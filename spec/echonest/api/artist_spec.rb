require 'helper'

describe Echonest::API::Artist do

  before do
    @client = Echonest::Client.new(:api_key => "AK")
  end

  #describe '#artist_biography' do
    #before do
      #stub_get("/api/v4/artist/biography").
      #with(:query => {:id => 'SOCZMFK12AC468668F'}).
      #to_return(:body => fixture("artist_profile.json"),
                 #:headers => {:content_type => "application/json; charset=utf-8"})
    #end

    #it "requests the correct resource" do
      #@client.artist_profile(:id => 'SOCZMFK12AC468668F')
      #expect(a_get("/api/v4/artist/profile").
      #with(:query => {:id => 'SOCZMFK12AC468668F'})).
      #to have_been_made
    #end

    #it "returns a artist" do
      #artist = @client.song_profile(:id => 'SOCZMFK12AC468668F')
      #expect(artist).to be_a Echonest::Song
      #expect(artist.id).to eq 'SOCZMFK12AC468668F'
    #end
  #end
  #
  describe "#artist_search" do

    before do
      stub_get("/api/v4/artist/search").
      with(:query => {
            :results => 1,
            :artist => 'radiohead'}).
        to_return(:body => fixture("artist_search.json"),
                  :headers => {:content_type => "application/json; charset=utf-8"})
    end


    it "requests the correct resource" do
      @client.artist_search(:results => 1,
                          :artist => 'radiohead')
      expect(a_get("/api/v4/artist/search")
      .with(:query => {:results => 1,
                       :artist => 'radiohead'}))
      .to have_been_made
    end

    it "returns artists" do
      artists = @client.artist_search(:results => 1,
                          :artist => 'radiohead')
      expect(artists).to be_an Array
      expect(artists.first.name).to eq "Radiohead"
    end


  end

end

