require 'helper'

describe Echonest::API::Song do

  before do
    @client = Echonest::Client.new(:api_key => "AK")
  end

  describe "#song_search" do

    before do
      stub_get("/api/v4/song/search").
      with(:query => {
            :results => 1,
            :artist => 'radiohead',
            :title => 'karma police'}).
        to_return(:body => fixture("songs.json"),
                  :headers => {:content_type => "application/json; charset=utf-8"})
    end


    it "requests the correct resource" do
      @client.song_search(:results => 1,
                          :artist => 'radiohead',
                          :title => 'karma police')
      expect(a_get("/api/v4/song/search")
      .with(:query => {:results => 1,
                      :artist => 'radiohead',
                      :title => 'karma police'},
                      ))
      .to have_been_made
    end

    it "returns songs" do
      songs = @client.song_search(:results => 1,
                          :artist => 'radiohead',
                          :title => 'karma police')
      expect(songs).to be_an Array
      expect(songs.first.title).to eq "Karma Police"
    end

  end

end
