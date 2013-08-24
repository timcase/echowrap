require 'helper'

describe Echowrap::API::Song do

  before do
    @client = new_test_client
  end

  describe "#song_search" do

    before do
      stub_get("/api/v4/song/search").
      with(:query => {
            :results => 1,
            :artist => 'radiohead',
            :title => 'karma police'}).
        to_return(:body => fixture("song/search.json"),
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

    it 'still returns an audio summary if bucket is not specified' do
      songs = @client.song_search(:results => 1,
                          :artist => 'radiohead',
                          :title => 'karma police')
      expect(songs.first.audio_summary).to be_an Echowrap::AudioSummary
    end

    it 'returns nil for any field of audio summary' do
      songs = @client.song_search(:results => 1,
                          :artist => 'radiohead',
                          :title => 'karma police')
      expect(songs.first.audio_summary.key).to be_nil
    end


  end

  describe '#song_profile' do
    before do
      stub_get("/api/v4/song/profile").
      with(:query => {:id => 'SODJXOA1313438FB61',
                      :bucket => ['artist_familiarity',
                                  'artist_hotttnesss',
                                  'artist_location',
                                  'audio_summary',
                                  'scores',
                                  'song_currency',
                                  'song_discovery',
                                  'song_hotttness',
                                  'song_type',
                                  'tracks',
                                  'id:7digital-US']}).
      to_return(:body => fixture("song/profile.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests the correct resource" do
      @client.song_profile(:id => 'SODJXOA1313438FB61',
                            :bucket => ['artist_familiarity',
                                        'artist_hotttnesss',
                                        'artist_location',
                                        'audio_summary',
                                        'scores',
                                        'song_currency',
                                        'song_discovery',
                                        'song_hotttness',
                                        'song_type',
                                        'tracks',
                                        'id:7digital-US'])
      expect(a_get("/api/v4/song/profile").
      with(:query => {:id => 'SODJXOA1313438FB61',
                      :bucket => ['artist_familiarity',
                                  'artist_hotttnesss',
                                  'artist_location',
                                  'audio_summary',
                                  'scores',
                                  'song_currency',
                                  'song_discovery',
                                  'song_hotttness',
                                  'song_type',
                                  'tracks',
                                  'id:7digital-US']})).
      to have_been_made
    end

    it "returns a song" do
      song = @client.song_profile(:id => 'SODJXOA1313438FB61',
                                  :bucket => ['artist_familiarity',
                                              'artist_hotttnesss',
                                              'artist_location',
                                              'audio_summary',
                                              'scores',
                                              'song_currency',
                                              'song_discovery',
                                              'song_hotttness',
                                              'song_type',
                                              'tracks',
                                              'id:7digital-US'])
      expect(song).to be_a Echowrap::Song
      expect(song.id).to eq 'SODJXOA1313438FB61'
    end

    it "returns artist familiarity" do
      song = @client.song_profile(:id => 'SODJXOA1313438FB61',
                              :bucket => ['artist_familiarity',
                                          'artist_hotttnesss',
                                          'artist_location',
                                          'audio_summary',
                                          'scores',
                                          'song_currency',
                                          'song_discovery',
                                          'song_hotttness',
                                          'song_type',
                                          'tracks',
                                          'id:7digital-US'])
      expect(song.artist_familiarity).to be_an Float
      expect(song.artist_familiarity).to eq 0.892819
    end

    it "returns artist hotttnesss" do
      song = @client.song_profile(:id => 'SODJXOA1313438FB61',
                              :bucket => ['artist_familiarity',
                                          'artist_hotttnesss',
                                          'artist_location',
                                          'audio_summary',
                                          'scores',
                                          'song_currency',
                                          'song_discovery',
                                          'song_hotttness',
                                          'song_type',
                                          'tracks',
                                          'id:7digital-US'])
      expect(song.artist_hotttnesss).to be_an Float
      expect(song.artist_hotttnesss).to eq 0.625762
    end

    it "returns an artist location" do
      song = @client.song_profile(:id => 'SODJXOA1313438FB61',
                              :bucket => ['artist_familiarity',
                                          'artist_hotttnesss',
                                          'artist_location',
                                          'audio_summary',
                                          'scores',
                                          'song_currency',
                                          'song_discovery',
                                          'song_hotttness',
                                          'song_type',
                                          'tracks',
                                          'id:7digital-US'])
      expect(song.artist_location).to be_an Echowrap::Location
      expect(song.artist_location.location).to eq "Gary, IN, US"
    end

    it "returns an audio summary" do
      song = @client.song_profile(:id => 'SODJXOA1313438FB61',
                              :bucket => ['artist_familiarity',
                                          'artist_hotttnesss',
                                          'artist_location',
                                          'audio_summary',
                                          'scores',
                                          'song_currency',
                                          'song_discovery',
                                          'song_hotttness',
                                          'song_type',
                                          'tracks',
                                          'id:7digital-US'])
      expect(song.audio_summary).to be_an Echowrap::AudioSummary
      expect(song.audio_summary.audio_md5).to eq "77688ec91b91e8cf5e105049a4227be9"
    end

    it "returns song currency" do
      song = @client.song_profile(:id => 'SODJXOA1313438FB61',
                              :bucket => ['artist_familiarity',
                                          'artist_hotttnesss',
                                          'artist_location',
                                          'audio_summary',
                                          'scores',
                                          'song_currency',
                                          'song_discovery',
                                          'song_hotttness',
                                          'song_type',
                                          'tracks',
                                          'id:7digital-US'])
      expect(song.song_currency).to be_an Float
      expect(song.song_currency).to eq 0.062214422885901594
    end

    it "returns song discovery" do
      song = @client.song_profile(:id => 'SODJXOA1313438FB61',
                              :bucket => ['artist_familiarity',
                                          'artist_hotttnesss',
                                          'artist_location',
                                          'audio_summary',
                                          'scores',
                                          'song_currency',
                                          'song_discovery',
                                          'song_hotttness',
                                          'song_type',
                                          'tracks',
                                          'id:7digital-US'])
      expect(song.song_discovery).to be_an Float
      expect(song.song_discovery).to eq 0.0008134358711419619
    end

    it "returns song hotness" do
      song = @client.song_profile(:id => 'SODJXOA1313438FB61',
                              :bucket => ['artist_familiarity',
                                          'artist_hotttnesss',
                                          'artist_location',
                                          'audio_summary',
                                          'scores',
                                          'song_currency',
                                          'song_discovery',
                                          'song_hotttness',
                                          'song_type',
                                          'tracks',
                                          'id:7digital-US'])
      expect(song.song_hotttnesss).to be_an Float
      expect(song.song_hotttnesss).to eq 0.744413
    end

    it "returns song type" do
      song = @client.song_profile(:id => 'SODJXOA1313438FB61',
                              :bucket => ['artist_familiarity',
                                          'artist_hotttnesss',
                                          'artist_location',
                                          'audio_summary',
                                          'scores',
                                          'song_currency',
                                          'song_discovery',
                                          'song_hotttness',
                                          'song_type',
                                          'tracks',
                                          'id:7digital-US'])
      expect(song.song_type).to be_an Array
      expect(song.song_type.first).to eq 'studio'
    end

    it "returns tracks" do
      song = @client.song_profile(:id => 'SODJXOA1313438FB61',
                              :bucket => ['artist_familiarity',
                                          'artist_hotttnesss',
                                          'artist_location',
                                          'audio_summary',
                                          'scores',
                                          'song_currency',
                                          'song_discovery',
                                          'song_hotttness',
                                          'song_type',
                                          'tracks',
                                          'id:7digital-US'])
      expect(song.tracks).to be_an Array
      expect(song.tracks.first.id).to eq 'TRDZFYM137EBC77532'
    end

  end

  describe '#song_identify' do
    context 'with POST' do
      before do
        stub_post("/api/v4/song/identify").
        to_return(:body => fixture("song/identify.json"),
                   :headers => {:content_type => "application/json; charset=utf-8"})
      end

      it 'requests the correct resource' do
        @client.song_identify(:query => fixture('billie_jean_query.json'))
        expect(a_post("/api/v4/song/identify")).to have_been_made
      end

      it "returns a song" do
        song = @client.song_identify(:query => fixture('billie_jean_query.json'))
        expect(song).to be_a Echowrap::Song
        expect(song.id).to eq 'SOKHYNL12A8C142FC7'
      end


    end

    context 'with GET' do
      before do
        stub_get("/api/v4/song/identify").
        with(:query => {:code => fixture('billie_jean_fingerprint.txt').read}).
        to_return(:body => fixture("song/identify.json"),
                   :headers => {:content_type => "application/json; charset=utf-8"})
      end

      it 'requests the correct resource' do
        @client.song_identify(:code => fixture('billie_jean_fingerprint.txt').read)
        expect(a_get("/api/v4/song/identify").
        with(:query => {:code => fixture('billie_jean_fingerprint.txt').read})).to have_been_made
      end

      it "returns a song" do
        song = @client.song_identify(:code => fixture('billie_jean_fingerprint.txt').read)
        expect(song).to be_a Echowrap::Song
        expect(song.id).to eq 'SOKHYNL12A8C142FC7'
      end

    end

  end


end
