require 'helper'

describe Echowrap::API::Playlist do
  before do
    @client = new_test_client
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

  describe "#playlist_dynamic_create" do

    before do
      stub_get("/api/v4/playlist/dynamic/create").
      with(:query => {:artist => 'radiohead'}).
        to_return(:body => fixture("playlist/dynamic/create.json"),
                  :headers => {:content_type => "application/json; charset=utf-8"})
    end


    it "requests the correct resource" do
      @client.playlist_dynamic_create(:artist => 'radiohead')
      expect(a_get("/api/v4/playlist/dynamic/create")
      .with(:query => {:artist => 'radiohead'},
                      ))
      .to have_been_made
    end

    it "returns session id" do
      playlist = @client.playlist_dynamic_create(:artist => 'radiohead')
      expect(playlist).to be_an Echowrap::Playlist
      expect(playlist.session_id).to eq "7c88f9c365294bab8534943d735f587c"
    end

  end

  describe "#playlist_dynamic_restart" do

    before do
      stub_get("/api/v4/playlist/dynamic/restart").
      with(:query => {:session_id => 'a8cddde7afdf4ac09b510aa1c1c50bf9', :artist => 'radiohead'}).
        to_return(:body => fixture("playlist/dynamic/restart.json"),
                  :headers => {:content_type => "application/json; charset=utf-8"})
    end


    it "requests the correct resource" do
      @client.playlist_dynamic_restart(:session_id => 'a8cddde7afdf4ac09b510aa1c1c50bf9', :artist => 'radiohead')
      expect(a_get("/api/v4/playlist/dynamic/restart")
      .with(:query => {:session_id => 'a8cddde7afdf4ac09b510aa1c1c50bf9', :artist => 'radiohead'},
                      ))
      .to have_been_made
    end

    it "returns session id" do
      playlist = @client.playlist_dynamic_restart(:session_id => 'a8cddde7afdf4ac09b510aa1c1c50bf9', :artist => 'radiohead')
      expect(playlist).to be_an Echowrap::Playlist
      expect(playlist.session_id).to eq "a8cddde7afdf4ac09b510aa1c1c50bf9"
    end

  end

  describe "#playlist_dynamic_next" do

    before do
      stub_get("/api/v4/playlist/dynamic/next").
      with(:query => {:session_id => 'a8cddde7afdf4ac09b510aa1c1c50bf9'}).
        to_return(:body => fixture("playlist/dynamic/next.json"),
                  :headers => {:content_type => "application/json; charset=utf-8"})
    end


    it "requests the correct resource" do
      @client.playlist_dynamic_next(:session_id => 'a8cddde7afdf4ac09b510aa1c1c50bf9')
      expect(a_get("/api/v4/playlist/dynamic/next")
      .with(:query => {:session_id => 'a8cddde7afdf4ac09b510aa1c1c50bf9'},
                      ))
      .to have_been_made
    end

    it "returns songs" do
      playlist = @client.playlist_dynamic_next(:session_id => 'a8cddde7afdf4ac09b510aa1c1c50bf9')
      expect(playlist).to be_an Echowrap::Playlist
      expect(playlist.songs.first.id).to eq "SOXIAKX12AF72AC774"
    end

    it "returns lookahead" do
      playlist = @client.playlist_dynamic_next(:session_id => 'a8cddde7afdf4ac09b510aa1c1c50bf9')
      expect(playlist).to be_an Echowrap::Playlist
      expect(playlist.lookahead.first.id).to eq "SOOVSGI12AB017E8ED"
    end
  end

  describe "#playlist_dynamic_feedback" do

    before do
      stub_get("/api/v4/playlist/dynamic/feedback").
      with(:query => {:session_id => 'a8cddde7afdf4ac09b510aa1c1c50bf9', :favorite_song => 'SOCZMFK12AC468668F'}).
        to_return(:body => fixture("playlist/dynamic/feedback.json"),
                  :headers => {:content_type => "application/json; charset=utf-8"})
    end


    it "requests the correct resource" do
      @client.playlist_dynamic_feedback(:session_id => 'a8cddde7afdf4ac09b510aa1c1c50bf9', :favorite_song => 'SOCZMFK12AC468668F')
      expect(a_get("/api/v4/playlist/dynamic/feedback")
      .with(:query => {:session_id => 'a8cddde7afdf4ac09b510aa1c1c50bf9', :favorite_song => 'SOCZMFK12AC468668F'},
                      ))
      .to have_been_made
    end

    it "returns boolean with response result" do
      result = @client.playlist_dynamic_feedback(:session_id => 'a8cddde7afdf4ac09b510aa1c1c50bf9', :favorite_song => 'SOCZMFK12AC468668F')
      expect(result).to be_truthy
    end
  end

  describe "#playlist_dynamic_steer" do

    before do
      stub_get("/api/v4/playlist/dynamic/steer").
      with(:query => {:session_id => 'a8cddde7afdf4ac09b510aa1c1c50bf9', :min_danceability => 0.5}).
        to_return(:body => fixture("playlist/dynamic/steer.json"),
                  :headers => {:content_type => "application/json; charset=utf-8"})
    end


    it "requests the correct resource" do
      @client.playlist_dynamic_steer(:session_id => 'a8cddde7afdf4ac09b510aa1c1c50bf9', :min_danceability => 0.5)
      expect(a_get("/api/v4/playlist/dynamic/steer")
      .with(:query => {:session_id => 'a8cddde7afdf4ac09b510aa1c1c50bf9', :min_danceability => 0.5},
                      ))
      .to have_been_made
    end

    it "returns boolean with response result" do
      result = @client.playlist_dynamic_steer(:session_id => 'a8cddde7afdf4ac09b510aa1c1c50bf9', :min_danceability => 0.5)
      expect(result).to be_truthy
    end
  end

  describe "#playlist_dynamic_info" do

    before do
      stub_get("/api/v4/playlist/dynamic/info").
      with(:query => {:session_id => 'a8cddde7afdf4ac09b510aa1c1c50bf9'}).
        to_return(:body => fixture("playlist/dynamic/info.json"),
                  :headers => {:content_type => "application/json; charset=utf-8"})
    end


    it "requests the correct resource" do
      @client.playlist_dynamic_info(:session_id => 'a8cddde7afdf4ac09b510aa1c1c50bf9')
      expect(a_get("/api/v4/playlist/dynamic/info")
      .with(:query => {:session_id => 'a8cddde7afdf4ac09b510aa1c1c50bf9'},
                      ))
      .to have_been_made
    end

    it "returns category map" do
      playlist = @client.playlist_dynamic_info(:session_id => 'a8cddde7afdf4ac09b510aa1c1c50bf9')
      expect(playlist.category_map).to be_an Echowrap::CategoryMap
      expect(playlist.category_map.childrens).to eq "any"
    end

    it "returns category seeds" do
      playlist = @client.playlist_dynamic_info(:session_id => 'a8cddde7afdf4ac09b510aa1c1c50bf9')
      expect(playlist.seeds).to be_an Echowrap::Seeds
      expect(playlist.seeds.artist_ids).to eq ['ARF8HTQ1187B9AE693']
    end

    it "returns rules"  do
      playlist = @client.playlist_dynamic_info(:session_id => 'a8cddde7afdf4ac09b510aa1c1c50bf9')
      expect(playlist.rules).to be_an Array
      expect(playlist.rules.first.rule).to eq "Don't put two copies of the same song in a playlist."
    end

    it "returns call list"  do
      playlist = @client.playlist_dynamic_info(:session_id => 'a8cddde7afdf4ac09b510aa1c1c50bf9')
      expect(playlist.call_list).to be_an Array
      expect(playlist.call_list.first.action).to eq 'create'
    end

    it "returns call list"  do
      playlist = @client.playlist_dynamic_info(:session_id => 'a8cddde7afdf4ac09b510aa1c1c50bf9')
      expect(playlist.options).to be_an Echowrap::Options
      expect(playlist.options.rank_type).to eq 'relevance'
    end
  end

  describe "#playlist_dynamic_delete" do

    before do
      stub_get("/api/v4/playlist/dynamic/delete").
      with(:query => {:session_id => 'a8cddde7afdf4ac09b510aa1c1c50bf9'}).
        to_return(:body => fixture("playlist/dynamic/delete.json"),
                  :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests the correct resource" do
      @client.playlist_dynamic_delete(:session_id => 'a8cddde7afdf4ac09b510aa1c1c50bf9')
      expect(a_get("/api/v4/playlist/dynamic/delete")
      .with(:query => {:session_id => 'a8cddde7afdf4ac09b510aa1c1c50bf9'},
                      ))
      .to have_been_made
    end

    it "returns boolean with response result" do
      result = @client.playlist_dynamic_delete(:session_id => 'a8cddde7afdf4ac09b510aa1c1c50bf9')
      expect(result).to be_truthy
    end
  end
end
