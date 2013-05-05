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
        to_return(:body => fixture("search_songs.json"),
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

  describe '#song_profile' do
    before do
      stub_get("/api/v4/song/profile").
      with(:query => {:id => 'SOCZMFK12AC468668F'}).
      to_return(:body => fixture("song_profile.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests the correct resource" do
      @client.song_profile(:id => 'SOCZMFK12AC468668F')
      expect(a_get("/api/v4/song/profile").
      with(:query => {:id => 'SOCZMFK12AC468668F'})).
      to have_been_made
    end

    it "returns a song" do
      song = @client.song_profile(:id => 'SOCZMFK12AC468668F')
      expect(song).to be_a Echonest::Song
      expect(song.id).to eq 'SOCZMFK12AC468668F'
    end
  end

  describe '#song_identify' do
    context 'with POST' do
      before do
        stub_post("/api/v4/song/identify").
        to_return(:body => fixture("song_identify.json"),
                   :headers => {:content_type => "application/json; charset=utf-8"})
      end

      it 'requests the correct resource' do
        @client.song_identify(:query => fixture('billie_jean_query.json'))
        expect(a_post("/api/v4/song/identify")).to have_been_made
      end

      it "returns a song" do
        song = @client.song_identify(:query => fixture('billie_jean_query.json'))
        expect(song).to be_a Echonest::Song
        expect(song.id).to eq 'SOKHYNL12A8C142FC7'
      end

    end

    context 'with GET' do
      before do
        stub_get("/api/v4/song/identify").
        with(:query => {:code => fixture('billie_jean_fingerprint.txt').read}).
        to_return(:body => fixture("song_identify.json"),
                   :headers => {:content_type => "application/json; charset=utf-8"})
      end

      it 'requests the correct resource' do
        @client.song_identify(:code => fixture('billie_jean_fingerprint.txt').read)
        expect(a_get("/api/v4/song/identify").
        with(:query => {:code => fixture('billie_jean_fingerprint.txt').read})).to have_been_made
      end

      it "returns a song" do
        song = @client.song_identify(:code => fixture('billie_jean_fingerprint.txt').read)
        expect(song).to be_a Echonest::Song
        expect(song.id).to eq 'SOKHYNL12A8C142FC7'
      end

    end

  end


end
