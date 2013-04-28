require 'helper'

describe Echonest::API::Track do
  before do
    @client = Echonest::Client.new(:api_key => "AK")
  end
  
  describe "#track_upload" do
    before do
      @mp3_url = 'http://freedownloads.last.fm/download/494669779/Calgary.mp3'
      stub_post("/api/v4/track/upload").
      with(:body => {:api_key => 'AK', :url => "http://freedownloads.last.fm/download/494669779/Calgary.mp3"}).
      to_return(:body => fixture("track.json"), 
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
  
end