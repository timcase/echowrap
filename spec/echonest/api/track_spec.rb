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

  describe "#track_analysis" do

    before do
      stub_request(:get, "http://echonest-analysis.s3.amazonaws.com/TR/TREYOVK13C9786E66B/3/full.json?AWSAccessKeyId=AKIAJRDFEY23UEVW42BQ&Expires=1367716357&Signature=dkZ4zsyf2%2BOuICu/veozEN5wWMs&api_key=AK").
      to_return(:body => fixture("track_analysis.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests the correct resource" do
      @client.track_analysis(:url => 'http://echonest-analysis.s3.amazonaws.com/TR/TREYOVK13C9786E66B/3/full.json?AWSAccessKeyId=AKIAJRDFEY23UEVW42BQ&Expires=1367716357&Signature=dkZ4zsyf2%2BOuICu/veozEN5wWMs')
      expect(a_request(:get, "http://echonest-analysis.s3.amazonaws.com/TR/TREYOVK13C9786E66B/3/full.json?AWSAccessKeyId=AKIAJRDFEY23UEVW42BQ&Expires=1367716357&Signature=dkZ4zsyf2%2BOuICu/veozEN5wWMs&api_key=AK")).
      to have_been_made
    end

    it "returns an analysis" do
      analysis = @client.track_analysis(:url => 'http://echonest-analysis.s3.amazonaws.com/TR/TREYOVK13C9786E66B/3/full.json?AWSAccessKeyId=AKIAJRDFEY23UEVW42BQ&Expires=1367716357&Signature=dkZ4zsyf2%2BOuICu/veozEN5wWMs')
      expect(analysis).to be_a Echonest::Analysis
      expect(analysis.id).to eq 1299731141
    end

    it 'returns a track as part of the analysis' do
      analysis = @client.track_analysis(:url => 'http://echonest-analysis.s3.amazonaws.com/TR/TREYOVK13C9786E66B/3/full.json?AWSAccessKeyId=AKIAJRDFEY23UEVW42BQ&Expires=1367716357&Signature=dkZ4zsyf2%2BOuICu/veozEN5wWMs')
      track = analysis.track
      expect(track).to be_a Echonest::Track
      expect(track.num_samples).to eq 5372342
    end

    it 'returns bars as part of the analysis' do
      analysis = @client.track_analysis(:url => 'http://echonest-analysis.s3.amazonaws.com/TR/TREYOVK13C9786E66B/3/full.json?AWSAccessKeyId=AKIAJRDFEY23UEVW42BQ&Expires=1367716357&Signature=dkZ4zsyf2%2BOuICu/veozEN5wWMs')
      bars = analysis.bars
      expect(bars).to be_a Array
      expect(bars.count).to eq 74
      bar = bars.first
      expect(bar.id).to eq 'echonest::bar_0.38205'
    end

    it 'returns beats as part of the analysis' do
      analysis = @client.track_analysis(:url => 'http://echonest-analysis.s3.amazonaws.com/TR/TREYOVK13C9786E66B/3/full.json?AWSAccessKeyId=AKIAJRDFEY23UEVW42BQ&Expires=1367716357&Signature=dkZ4zsyf2%2BOuICu/veozEN5wWMs')
      beats = analysis.beats
      expect(beats).to be_a Array
      expect(beats.count).to eq 300
      beat = beats.first
      expect(beat.id).to eq 'echonest::beat_0.38205'
    end

    it 'returns beats as part of the analysis' do
      analysis = @client.track_analysis(:url => 'http://echonest-analysis.s3.amazonaws.com/TR/TREYOVK13C9786E66B/3/full.json?AWSAccessKeyId=AKIAJRDFEY23UEVW42BQ&Expires=1367716357&Signature=dkZ4zsyf2%2BOuICu/veozEN5wWMs')
      beats = analysis.beats
      expect(beats).to be_a Array
      expect(beats.count).to eq 300
      beat = beats.first
      expect(beat.id).to eq 'echonest::beat_0.38205'
    end

    it 'returns sections as part of the analysis' do
      analysis = @client.track_analysis(:url => 'http://echonest-analysis.s3.amazonaws.com/TR/TREYOVK13C9786E66B/3/full.json?AWSAccessKeyId=AKIAJRDFEY23UEVW42BQ&Expires=1367716357&Signature=dkZ4zsyf2%2BOuICu/veozEN5wWMs')
      sections = analysis.sections
      expect(sections).to be_a Array
      expect(sections.count).to eq 9
      section = sections.first
      expect(section.id).to eq 'echonest::section_0.0'
    end

    it 'returns segments as part of the analysis' do
      analysis = @client.track_analysis(:url => 'http://echonest-analysis.s3.amazonaws.com/TR/TREYOVK13C9786E66B/3/full.json?AWSAccessKeyId=AKIAJRDFEY23UEVW42BQ&Expires=1367716357&Signature=dkZ4zsyf2%2BOuICu/veozEN5wWMs')
      segments = analysis.segments
      expect(segments).to be_a Array
      expect(segments.count).to eq 683
      segment = segments.first
      expect(segment.id).to eq 'echonest::segment_0.0'
    end

    it 'returns tatums as part of the analysis' do
      analysis = @client.track_analysis(:url => 'http://echonest-analysis.s3.amazonaws.com/TR/TREYOVK13C9786E66B/3/full.json?AWSAccessKeyId=AKIAJRDFEY23UEVW42BQ&Expires=1367716357&Signature=dkZ4zsyf2%2BOuICu/veozEN5wWMs')
      tatums = analysis.tatums
      expect(tatums).to be_a Array
      expect(tatums.count).to eq 599
      tatum = tatums.first
      expect(tatum.id).to eq 'echonest::tatum_0.38205'
    end


  end

end
