require 'helper'

describe Echonest::API::Track do
  before do
    @client = Echonest::Client.new(:api_key => "AK")
  end

  describe "#track_upload" do

    context "with track as url option" do
      before do
        stub_post("/api/v4/track/upload").
        with(:body => {:api_key => 'AK', :url => "http://freedownloads.last.fm/download/494669779/Calgary.mp3"}).
        to_return(:body => fixture("track_upload.json"),
                   :headers => {:content_type => "application/json; charset=utf-8"})
      end

      it "requests the correct resource" do
        @client.track_upload(:url => "http://freedownloads.last.fm/download/494669779/Calgary.mp3")
        expect(a_post("/api/v4/track/upload").
        with(:body => {:api_key => 'AK', :url => 'http://freedownloads.last.fm/download/494669779/Calgary.mp3'})).
        to have_been_made
      end

      it "returns a track" do
        track = @client.track_upload(:url => "http://freedownloads.last.fm/download/494669779/Calgary.mp3")
        expect(track).to be_a Echonest::Track
        expect(track.id).to eq 'TRGOVKX128F7FA5920'
      end
    end

     context "with local audio file and using filetype option" do

       before do
         stub_post("/api/v4/track/upload").
         to_return(:body => fixture("track_upload.json"),
                    :headers => {:content_type => "application/json; charset=utf-8"})
       end

       it 'requests the correct resource' do
         @client.track_upload(:track => fixture('technolol-music.mp3'))
         expect(a_post("/api/v4/track/upload")).to have_been_made
       end

       it "returns a track" do
         track = @client.track_upload(:track => fixture('technolol-music.mp3'))
         expect(track).to be_a Echonest::Track
         expect(track.id).to eq 'TRGOVKX128F7FA5920'
       end

     end
  end

  describe "#track_profile" do
    before do
      stub_get("/api/v4/track/profile").
      with(:query => {:id => 'TRTLKZV12E5AC92E11'}).
      to_return(:body => fixture("track_profile.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests the correct resource" do
      @client.track_profile(:id => 'TRTLKZV12E5AC92E11')
      expect(a_get("/api/v4/track/profile").
      with(:query => {:id => 'TRTLKZV12E5AC92E11'})).
      to have_been_made
    end

    it "returns a track" do
      track = @client.track_profile(:id => 'TRTLKZV12E5AC92E11')
      expect(track).to be_a Echonest::Track
      expect(track.id).to eq 'TRTLKZV12E5AC92E11'
    end

    it 'returns an audio summary with track' do
      track = @client.track_profile(:id => 'TRTLKZV12E5AC92E11')
      expect(track.audio_summary).to be_a Echonest::AudioSummary
      expect(track.audio_summary.key).to eq 1

    end
  end

end
