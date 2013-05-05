require 'helper'

describe Echonest::API::Artist do

  before do
    @client = Echonest::Client.new(:api_key => "AK")
  end

  describe '#artist_biographies' do
    before do
      stub_get("/api/v4/artist/biographies").
      with(:query => {:id => 'ARH6W4X1187B99274F'}).
      to_return(:body => fixture("artist_biographies.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests the correct resource" do
      @client.artist_biographies(:id => 'ARH6W4X1187B99274F')
      expect(a_get("/api/v4/artist/biographies").
      with(:query => {:id => 'ARH6W4X1187B99274F'})).
      to have_been_made
    end

    it "returns a biography" do
      biographies = @client.artist_biographies(:id => 'ARH6W4X1187B99274F')
      expect(biographies).to be_an Array
      expect(biographies.first.site).to eq 'last.fm'
      expect(biographies.first.license.attribution).to eq 'Last.fm'
    end
  end

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

