require 'helper'

describe Echonest::API::Playlist do
  before do
    @client = Echonest::Client.new(:api_key => "AK")
  end

  describe "#playlist_basic" do

    before do
      stub_get("/api/v4/playlist/basic").
      with(:query => {:artist => 'radiohead'}).
        to_return(:body => fixture("playlist/basic.json"),
                  :headers => {:content_type => "application/json; charset=utf-8"})
    end


    it "requests the correct resource" do
      @client.playlist_basic(:artist => 'radiohead')
      expect(a_get("/api/v4/playlist/basic")
      .with(:query => {:artist => 'radiohead'},
                      ))
      .to have_been_made
    end

    it "returns songs" do
      songs = @client.playlist_basic(:artist => 'radiohead')
      expect(songs).to be_an Array
      expect(songs.first.title).to eq "Only In Dreams"
    end

    it "returns songs with tracks" do
      songs = @client.playlist_basic(:artist => 'radiohead')
      expect(songs).to be_an Array
      expect(songs.first.tracks.first.id).to eq "TRWKBOB13A79B0C90E"
    end

  end

  describe "#playlist_static" do

    before do
      stub_get("/api/v4/playlist/static").
      with(:query => {:artist => 'radiohead'}).
        to_return(:body => fixture("playlist/static.json"),
                  :headers => {:content_type => "application/json; charset=utf-8"})
    end


    it "requests the correct resource" do
      @client.playlist_static(:artist => 'radiohead')
      expect(a_get("/api/v4/playlist/static")
      .with(:query => {:artist => 'radiohead'},
                      ))
      .to have_been_made
    end

    it "returns songs" do
      songs = @client.playlist_static(:artist => 'radiohead')
      expect(songs).to be_an Array
      expect(songs.first.title).to eq "Knockdown Dragout"
    end

    it "returns songs with tracks" do
      songs = @client.playlist_static(:artist => 'radiohead')
      expect(songs).to be_an Array
      expect(songs.first.tracks.first.id).to eq "TRDXNUI13A79B0B146"
    end

  end
end
