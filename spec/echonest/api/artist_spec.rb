require 'helper'

describe Echowrap::API::Artist do

  before do
    @client = new_test_client
  end

  describe '#artist_biographies' do
    before do
      stub_get("/api/v4/artist/biographies").
      with(:query => {:id => 'ARH6W4X1187B99274F'}).
      to_return(:body => fixture("artist/biographies.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests the correct resource" do
      @client.artist_biographies(:id => 'ARH6W4X1187B99274F')
      expect(a_get("/api/v4/artist/biographies").
      with(:query => {:id => 'ARH6W4X1187B99274F'})).
      to have_been_made
    end

    it "returns biographies" do
      biographies = @client.artist_biographies(:id => 'ARH6W4X1187B99274F')
      expect(biographies).to be_an Array
      expect(biographies.first.site).to eq 'last.fm'
      expect(biographies.first.license.attribution).to eq 'Last.fm'
    end
  end

  describe '#artist_blogs' do
    before do
      stub_get("/api/v4/artist/blogs").
      with(:query => {:id => 'ARH6W4X1187B99274F'}).
      to_return(:body => fixture("artist/blogs.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests the correct resource" do
      @client.artist_blogs(:id => 'ARH6W4X1187B99274F')
      expect(a_get("/api/v4/artist/blogs").
      with(:query => {:id => 'ARH6W4X1187B99274F'})).
      to have_been_made
    end

    it "returns blogs" do
      blogs = @client.artist_blogs(:id => 'ARH6W4X1187B99274F')
      expect(blogs).to be_an Array
      expect(blogs.first.id).to eq '30fc8108d77316c6789140bef92ecc09'
    end
  end

  describe "#artist_extract" do

    before do
      stub_get("/api/v4/artist/extract").
      with(:query => {
            :results => 1,
            :text => 'Siriusmo is my favorite, but I also like hrvatski'}).
        to_return(:body => fixture("artist/extract.json"),
                  :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests the correct resource" do
      @client.artist_extract(:results => 1,
                          :text => 'Siriusmo is my favorite, but I also like hrvatski')
      expect(a_get("/api/v4/artist/extract")
      .with(:query => {:results => 1,
                       :text => 'Siriusmo is my favorite, but I also like hrvatski'}))
      .to have_been_made
    end

    it "returns artists" do
      artists = @client.artist_extract(:results => 1,
                          :text => 'Siriusmo is my favorite, but I also like hrvatski')
      expect(artists).to be_an Array
      expect(artists.first.name).to eq "Siriusmo"
    end

  end

  describe '#artist_familiarity' do
    before do
      stub_get("/api/v4/artist/familiarity").
      with(:query => {:id => 'ARH6W4X1187B99274F'}).
      to_return(:body => fixture("artist/familiarity.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests the correct resource" do
      @client.artist_familiarity(:id => 'ARH6W4X1187B99274F')
      expect(a_get("/api/v4/artist/familiarity").
      with(:query => {:id => 'ARH6W4X1187B99274F'})).
      to have_been_made
    end

    it "returns familiarity" do
      familiarity = @client.artist_familiarity(:id => 'ARH6W4X1187B99274F')
      expect(familiarity).to be_an Echowrap::Familiarity
      expect(familiarity.id).to eq 'ARH6W4X1187B99274F'
    end
  end

  describe '#artist_hotttnesss' do
    before do
      stub_get("/api/v4/artist/hotttnesss").
      with(:query => {:id => 'ARH6W4X1187B99274F'}).
      to_return(:body => fixture("artist/hotttnesss.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests the correct resource" do
      @client.artist_hotttnesss(:id => 'ARH6W4X1187B99274F')
      expect(a_get("/api/v4/artist/hotttnesss").
      with(:query => {:id => 'ARH6W4X1187B99274F'})).
      to have_been_made
    end

    it "returns hotttnesss" do
      hotttnesss = @client.artist_hotttnesss(:id => 'ARH6W4X1187B99274F')
      expect(hotttnesss).to be_an Echowrap::Hotttnesss
      expect(hotttnesss.id).to eq 'ARH6W4X1187B99274F'
    end
  end

  describe '#artist_images' do
    before do
      stub_get("/api/v4/artist/images").
      with(:query => {:id => 'ARH6W4X1187B99274F'}).
      to_return(:body => fixture("artist/images.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests the correct resource" do
      @client.artist_images(:id => 'ARH6W4X1187B99274F')
      expect(a_get("/api/v4/artist/images").
      with(:query => {:id => 'ARH6W4X1187B99274F'})).
      to have_been_made
    end

    it "returns images" do
      images = @client.artist_images(:id => 'ARH6W4X1187B99274F')
      expect(images).to be_an Array
      expect(images.first.url).to eq 'http://userserve-ak.last.fm/serve/_/102639.jpg'
      expect(images.first.license.attribution).to eq 'last.fm'
    end
  end

  describe '#artist_list_genres' do
    before do
      stub_get("/api/v4/artist/list_genres").
      to_return(:body => fixture("artist/list_genres.json"),
                :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests the correct resource" do
      @client.artist_list_genres
      expect(a_get("/api/v4/artist/list_genres")).to have_been_made
    end

    it "returns genres" do
      genres = @client.artist_list_genres
      expect(genres).to be_an Array
      expect(genres.first.name).to eq 'a cappella'
    end
  end

  describe '#artist_list_terms' do
    before do
      stub_get("/api/v4/artist/list_terms").
      to_return(:body => fixture("artist/list_terms.json"),
                :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests the correct resource" do
      @client.artist_list_terms
      expect(a_get("/api/v4/artist/list_terms")).to have_been_made
    end

    it "returns terms" do
      terms = @client.artist_list_terms
      expect(terms).to be_an Array
      expect(terms.first.name).to eq '00s'
    end
  end

  describe '#artist_news' do
    before do
      stub_get("/api/v4/artist/news").
      with(:query => {:id => 'ARH6W4X1187B99274F'}).
      to_return(:body => fixture("artist/news.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests the correct resource" do
      @client.artist_news(:id => 'ARH6W4X1187B99274F')
      expect(a_get("/api/v4/artist/news").
      with(:query => {:id => 'ARH6W4X1187B99274F'})).
      to have_been_made
    end

    it "returns news" do
      news = @client.artist_news(:id => 'ARH6W4X1187B99274F')
      expect(news).to be_an Array
      expect(news.first.id).to eq '29c1699c8464426781f3e012d29fc1f6'
    end
  end

  describe '#artist_profile' do
    before do
      stub_get("/api/v4/artist/profile").
      with(:query => {:id => 'ARH6W4X1187B99274F',
                       :bucket => ['artist_location',
                                   'biographies',
                                   'blogs',
                                   'doc_counts',
                                   'familiarity',
                                   'hotttnesss',
                                   'images',
                                   'news',
                                   'songs',
                                   'reviews',
                                   'terms',
                                   'urls',
                                   'video',
                                   'years_active',
                                   'id:musicbrainz']}).
      to_return(:body => fixture("artist/profile.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests the correct resource" do
      @client.artist_profile(:id => 'ARH6W4X1187B99274F',
                             :bucket => ['artist_location',
                                          'biographies',
                                          'blogs',
                                          'doc_counts',
                                          'familiarity',
                                          'hotttnesss',
                                          'images',
                                          'news',
                                          'songs',
                                          'reviews',
                                          'terms',
                                          'urls',
                                          'video',
                                          'years_active',
                                          'id:musicbrainz'])
      expect(a_get("/api/v4/artist/profile").
      with(:query => {:id => 'ARH6W4X1187B99274F',
                       :bucket => ['artist_location',
                                    'biographies',
                                    'blogs',
                                    'doc_counts',
                                    'familiarity',
                                    'hotttnesss',
                                    'images',
                                    'news',
                                    'songs',
                                    'reviews',
                                    'terms',
                                    'urls',
                                    'video',
                                    'years_active',
                                    'id:musicbrainz']})).
      to have_been_made
    end

    it "returns an artist" do
      artist = @client.artist_profile(:id => 'ARH6W4X1187B99274F',
                             :bucket => ['artist_location',
                                          'biographies',
                                          'blogs',
                                          'doc_counts',
                                          'familiarity',
                                          'hotttnesss',
                                          'images',
                                          'news',
                                          'songs',
                                          'reviews',
                                          'terms',
                                          'urls',
                                          'video',
                                          'years_active',
                                          'id:musicbrainz'])
      expect(artist).to be_a Echowrap::Artist
      expect(artist.id).to eq 'ARH6W4X1187B99274F'
    end

     it 'returns an artist with biographies' do
       artist = @client.artist_profile(:id => 'ARH6W4X1187B99274F',
                              :bucket => ['artist_location',
                                           'biographies',
                                           'blogs',
                                           'doc_counts',
                                           'familiarity',
                                           'hotttnesss',
                                           'images',
                                           'news',
                                           'songs',
                                           'reviews',
                                           'terms',
                                           'urls',
                                           'video',
                                           'years_active',
                                           'id:musicbrainz'])
       expect(artist.biographies).to be_an Array
       expect(artist.biographies.first.site).to eq 'trouserpress'
     end

     it 'returns an artist with blogs' do
       artist = @client.artist_profile(:id => 'ARH6W4X1187B99274F',
                              :bucket => ['artist_location',
                                           'biographies',
                                           'blogs',
                                           'doc_counts',
                                           'familiarity',
                                           'hotttnesss',
                                           'images',
                                           'news',
                                           'songs',
                                           'reviews',
                                           'terms',
                                           'urls',
                                           'video',
                                           'years_active',
                                           'id:musicbrainz'])
       expect(artist.blogs).to be_an Array
       expect(artist.blogs.first.id).to eq '24bfd596c968ccee4069f2b21817d692'
     end

     it 'returns an artist with a doc counts' do
       artist = @client.artist_profile(:id => 'ARH6W4X1187B99274F',
                              :bucket => ['artist_location',
                                           'biographies',
                                           'blogs',
                                           'doc_counts',
                                           'familiarity',
                                           'hotttnesss',
                                           'images',
                                           'news',
                                           'songs',
                                           'reviews',
                                           'terms',
                                           'urls',
                                           'video',
                                           'years_active',
                                           'id:musicbrainz'])
       expect(artist.doc_counts).to be_an Echowrap::DocCounts
       expect(artist.doc_counts.songs).to eq 333
     end

     it 'returns an artist with familiarity' do
       artist = @client.artist_profile(:id => 'ARH6W4X1187B99274F',
                              :bucket => ['artist_location',
                                           'biographies',
                                           'blogs',
                                           'doc_counts',
                                           'familiarity',
                                           'hotttnesss',
                                           'images',
                                           'news',
                                           'songs',
                                           'reviews',
                                           'terms',
                                           'urls',
                                           'video',
                                           'years_active',
                                           'id:musicbrainz'])
       expect(artist.familiarity).to be_an Float
       expect(artist.familiarity).to eq 0.897745
     end

     it 'returns an artist with hotttnesss' do
       artist = @client.artist_profile(:id => 'ARH6W4X1187B99274F',
                              :bucket => ['artist_location',
                                           'biographies',
                                           'blogs',
                                           'doc_counts',
                                           'familiarity',
                                           'hotttnesss',
                                           'images',
                                           'news',
                                           'songs',
                                           'reviews',
                                           'terms',
                                           'urls',
                                           'video',
                                           'years_active',
                                           'id:musicbrainz'])
       expect(artist.hotttnesss).to be_an Float
       expect(artist.hotttnesss).to eq 0.64754
     end

     it 'returns an artist with images' do
       artist = @client.artist_profile(:id => 'ARH6W4X1187B99274F',
                              :bucket => ['artist_location',
                                           'biographies',
                                           'blogs',
                                           'doc_counts',
                                           'familiarity',
                                           'hotttnesss',
                                           'images',
                                           'news',
                                           'songs',
                                           'reviews',
                                           'terms',
                                           'urls',
                                           'video',
                                           'years_active',
                                           'id:musicbrainz'])
       expect(artist.images).to be_an Array
       expect(artist.images.first.url).to eq 'http://userserve-ak.last.fm/serve/_/102639.jpg'
     end

     it 'returns an artist with a location' do
       artist = @client.artist_profile(:id => 'ARH6W4X1187B99274F',
                              :bucket => ['artist_location',
                                           'biographies',
                                           'blogs',
                                           'doc_counts',
                                           'familiarity',
                                           'hotttnesss',
                                           'images',
                                           'news',
                                           'songs',
                                           'reviews',
                                           'terms',
                                           'urls',
                                           'video',
                                           'years_active',
                                           'id:musicbrainz'])
       expect(artist.location).to be_an Echowrap::Location
       expect(artist.location.location).to eq 'Abingdon, England, GB'
     end

     it 'returns an artist with news' do
       artist = @client.artist_profile(:id => 'ARH6W4X1187B99274F',
                              :bucket => ['artist_location',
                                           'biographies',
                                           'blogs',
                                           'doc_counts',
                                           'familiarity',
                                           'hotttnesss',
                                           'images',
                                           'news',
                                           'songs',
                                           'reviews',
                                           'terms',
                                           'urls',
                                           'video',
                                           'years_active',
                                           'id:musicbrainz'])
       expect(artist.news).to be_an Array
       expect(artist.news.first.id).to eq 'c72241d996fa856b38d88acd4cedec18'
     end

     it 'returns an artist with reviews' do
       artist = @client.artist_profile(:id => 'ARH6W4X1187B99274F',
                              :bucket => ['artist_location',
                                           'biographies',
                                           'blogs',
                                           'doc_counts',
                                           'familiarity',
                                           'hotttnesss',
                                           'images',
                                           'news',
                                           'songs',
                                           'reviews',
                                           'terms',
                                           'urls',
                                           'video',
                                           'years_active',
                                           'id:musicbrainz'])
       expect(artist.reviews).to be_an Array
       expect(artist.reviews.first.id).to eq '3f9fca724678df56f34845365110c511'
     end

     it 'returns an artist with songs' do
       artist = @client.artist_profile(:id => 'ARH6W4X1187B99274F',
                              :bucket => ['artist_location',
                                           'biographies',
                                           'blogs',
                                           'doc_counts',
                                           'familiarity',
                                           'hotttnesss',
                                           'images',
                                           'news',
                                           'songs',
                                           'reviews',
                                           'terms',
                                           'urls',
                                           'video',
                                           'years_active',
                                           'id:musicbrainz'])
       expect(artist.songs).to be_an Array
       expect(artist.songs.first.id).to eq 'SOAROML1316771494B'
     end


     it 'returns an artist with terms' do
       artist = @client.artist_profile(:id => 'ARH6W4X1187B99274F',
                              :bucket => ['artist_location',
                                           'biographies',
                                           'blogs',
                                           'doc_counts',
                                           'familiarity',
                                           'hotttnesss',
                                           'images',
                                           'news',
                                           'songs',
                                           'reviews',
                                           'terms',
                                           'urls',
                                           'video',
                                           'years_active',
                                           'id:musicbrainz'])
       expect(artist.terms).to be_an Array
       expect(artist.terms.first.name).to eq 'rock'
     end

     it 'returns an artist with urls' do
       artist = @client.artist_profile(:id => 'ARH6W4X1187B99274F',
                              :bucket => ['artist_location',
                                           'biographies',
                                           'blogs',
                                           'doc_counts',
                                           'familiarity',
                                           'hotttnesss',
                                           'images',
                                           'news',
                                           'songs',
                                           'reviews',
                                           'terms',
                                           'urls',
                                           'video',
                                           'years_active',
                                           'id:musicbrainz'])
       expect(artist.urls).to be_an Echowrap::Urls
       expect(artist.urls.official_url).to eq 'http://radiohead.com'
     end

     it 'returns an artist with video' do
       artist = @client.artist_profile(:id => 'ARH6W4X1187B99274F',
                              :bucket => ['artist_location',
                                           'biographies',
                                           'blogs',
                                           'doc_counts',
                                           'familiarity',
                                           'hotttnesss',
                                           'images',
                                           'news',
                                           'songs',
                                           'reviews',
                                           'terms',
                                           'urls',
                                           'video',
                                           'years_active',
                                           'id:musicbrainz'])
       expect(artist.video).to be_an Array
       expect(artist.video.first.id).to eq '36f2c2daf09feb738980d4783dc0a3b1'
     end

     it 'returns an artist with foreign_ids' do
       artist = @client.artist_profile(:id => 'ARH6W4X1187B99274F',
                              :bucket => ['artist_location',
                                           'biographies',
                                           'blogs',
                                           'doc_counts',
                                           'familiarity',
                                           'hotttnesss',
                                           'images',
                                           'news',
                                           'songs',
                                           'reviews',
                                           'terms',
                                           'urls',
                                           'video',
                                           'years_active',
                                           'id:musicbrainz'])
       expect(artist.foreign_ids).to be_an Array
       expect(artist.foreign_ids.first.foreign_id).to eq 'musicbrainz:artist:a74b1b7f-71a5-4011-9441-d0b5e4122711'
     end

     it 'returns an artist with years active' do
       artist = @client.artist_profile(:id => 'ARH6W4X1187B99274F',
                              :bucket => ['artist_location',
                                           'biographies',
                                           'blogs',
                                           'doc_counts',
                                           'familiarity',
                                           'hotttnesss',
                                           'images',
                                           'news',
                                           'songs',
                                           'reviews',
                                           'terms',
                                           'urls',
                                           'video',
                                           'years_active',
                                           'id:musicbrainz'])
       expect(artist.years_active).to be_an Array
       expect(artist.years_active.first.start).to eq 1985
     end

  end

  describe '#artist_reviews' do
    before do
      stub_get("/api/v4/artist/reviews").
      with(:query => {:id => 'ARH6W4X1187B99274F'}).
      to_return(:body => fixture("artist/reviews.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests the correct resource" do
      @client.artist_reviews(:id => 'ARH6W4X1187B99274F')
      expect(a_get("/api/v4/artist/reviews").
      with(:query => {:id => 'ARH6W4X1187B99274F'})).
      to have_been_made
    end

    it "returns reviews" do
      reviews = @client.artist_reviews(:id => 'ARH6W4X1187B99274F')
      expect(reviews).to be_an Array
      expect(reviews.first.id).to eq '3f9fca724678df56f34845365110c511'
    end
  end

  describe "#artist_search" do

    before do
      stub_get("/api/v4/artist/search").
      with(:query => {
            :results => 1,
            :name => 'radiohead'}).
        to_return(:body => fixture("artist/search.json"),
                  :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests the correct resource" do
      @client.artist_search(:results => 1,
                          :name => 'radiohead')
      expect(a_get("/api/v4/artist/search")
      .with(:query => {:results => 1,
                       :name => 'radiohead'}))
      .to have_been_made
    end

    it "returns artists" do
      artists = @client.artist_search(:results => 1,
                          :name => 'radiohead')
      expect(artists).to be_an Array
      expect(artists.first.name).to eq "Radiohead"
    end

  end

  describe '#artist_songs' do
    before do
      stub_get("/api/v4/artist/songs").
      with(:query => {:id => 'ARH6W4X1187B99274F'}).
      to_return(:body => fixture("artist/songs.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests the correct resource" do
      @client.artist_songs(:id => 'ARH6W4X1187B99274F')
      expect(a_get("/api/v4/artist/songs").
      with(:query => {:id => 'ARH6W4X1187B99274F'})).
      to have_been_made
    end

    it "returns songs" do
      songs = @client.artist_songs(:id => 'ARH6W4X1187B99274F')
      expect(songs).to be_an Array
      expect(songs.first.title).to eq 'Give Up The Ghost (Brokenchord RMX)'
    end
  end

  describe "#artist_similar" do

    before do
      stub_get("/api/v4/artist/similar").
      with(:query => {
            :results => 1,
            :name => 'radiohead'}).
        to_return(:body => fixture("artist/similar.json"),
                  :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests the correct resource" do
      @client.artist_similar(:results => 1,
                          :name => 'radiohead')
      expect(a_get("/api/v4/artist/similar")
      .with(:query => {:results => 1,
                       :name => 'radiohead'}))
      .to have_been_made
    end

    it "returns artists" do
      artists = @client.artist_similar(:results => 1,
                          :name => 'radiohead')
      expect(artists).to be_an Array
      expect(artists.first.name).to eq "Thom Yorke"
    end

    it 'does not throw an error when no artists are returned by Echonest' do

      stub_get("/api/v4/artist/similar").
      with(:query => {
            :results => 1,
            :name => 'herpderp'}).
        to_return(:body => fixture("artist/similar_with_no_results.json"),
                  :headers => {:content_type => "application/json; charset=utf-8"})
      expect{ @client.artist_similar(:results => 1,
                          :name => 'herpderp')}.to_not raise_error
    end
  end

  describe "#artist_suggest" do

    before do
      stub_get("/api/v4/artist/suggest").
      with(:query => {
            :results => 1,
            :name => 'radioh'}).
        to_return(:body => fixture("artist/suggest.json"),
                  :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests the correct resource" do
      @client.artist_suggest(:results => 1,
                          :name => 'radioh')
      expect(a_get("/api/v4/artist/suggest")
      .with(:query => {:results => 1,
                       :name => 'radioh'}))
      .to have_been_made
    end

    it "returns artists" do
      artists = @client.artist_suggest(:results => 1,
                          :name => 'radioh')
      expect(artists).to be_an Array
      expect(artists.first.name).to eq "Radiohead"
    end

  end

  describe "#artist_terms" do

    before do
      stub_get("/api/v4/artist/terms").
      with(:query => {
            :results => 1,
            :name => 'radiohead'}).
        to_return(:body => fixture("artist/terms.json"),
                  :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests the correct resource" do
      @client.artist_terms(:results => 1,
                          :name => 'radiohead')
      expect(a_get("/api/v4/artist/terms")
      .with(:query => {:results => 1,
                       :name => 'radiohead'}))
      .to have_been_made
    end

    it "returns artists" do
      terms = @client.artist_terms(:results => 1,
                          :name => 'radiohead')
      expect(terms).to be_an Array
      expect(terms.first.name).to eq "rock"
    end

  end

  describe "#artist_top_hottt" do

    before do
      stub_get("/api/v4/artist/top_hottt").
      with(:query => {
            :results => 1,
            :genre => 'dance'}).
        to_return(:body => fixture("artist/top_hottt.json"),
                  :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests the correct resource" do
      @client.artist_top_hottt(:results => 1,
                          :genre => 'dance')
      expect(a_get("/api/v4/artist/top_hottt")
      .with(:query => {:results => 1,
                       :genre => 'dance'}))
      .to have_been_made
    end

    it "returns artists" do
      artists = @client.artist_top_hottt(:results => 1,
                          :genre => 'dance')
      expect(artists).to be_an Array
      expect(artists.first.name).to eq "Justin Timberlake"
    end

  end

  describe "#artist_top_terms" do

    before do
      stub_get("/api/v4/artist/top_terms").
      with(:query => {
            :results => 100}).
        to_return(:body => fixture("artist/top_terms.json"),
                  :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests the correct resource" do
      @client.artist_top_terms(:results => 100)
      expect(a_get("/api/v4/artist/top_terms")
      .with(:query => {:results => 100}))
      .to have_been_made
    end

    it "returns terms" do
      terms = @client.artist_top_terms(:results => 100)
      expect(terms).to be_an Array
      expect(terms.first.name).to eq "rock"
    end

  end

  describe "#artist_twitter" do

    before do
      stub_get("/api/v4/artist/twitter").
      with(:query => {
            :results => 1,
            :name => 'radiohead'}).
        to_return(:body => fixture("artist/twitter.json"),
                  :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests the correct resource" do
      @client.artist_twitter(:results => 1,
                          :name => 'radiohead')
      expect(a_get("/api/v4/artist/twitter")
      .with(:query => {:results => 1,
                       :name => 'radiohead'}))
      .to have_been_made
    end

    it "returns an artist" do
      artist = @client.artist_twitter(:results => 1,
                          :name => 'radiohead')
      expect(artist).to be_an Echowrap::Artist
      expect(artist.twitter).to eq "radiohead"
    end

  end

  describe "#artist_urls" do

    before do
      stub_get("/api/v4/artist/urls").
      with(:query => {
            :name => 'radiohead'}).
        to_return(:body => fixture("artist/urls.json"),
                  :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests the correct resource" do
      @client.artist_urls(:name => 'radiohead')
      expect(a_get("/api/v4/artist/urls")
      .with(:query => {
                       :name => 'radiohead'}))
      .to have_been_made
    end

    it "returns urls" do
      urls = @client.artist_urls(
                          :name => 'radiohead')
      expect(urls).to be_an Echowrap::Urls
      expect(urls.lastfm_url).to eq "http://www.last.fm/music/Radiohead"
    end

  end

  describe '#artist_video' do
    before do
      stub_get("/api/v4/artist/video").
      with(:query => {:id => 'ARH6W4X1187B99274F'}).
      to_return(:body => fixture("artist/video.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests the correct resource" do
      @client.artist_video(:id => 'ARH6W4X1187B99274F')
      expect(a_get("/api/v4/artist/video").
      with(:query => {:id => 'ARH6W4X1187B99274F'})).
      to have_been_made
    end

    it "returns video" do
      video= @client.artist_video(:id => 'ARH6W4X1187B99274F')
      expect(video).to be_an Array
      expect(video.first.title).to eq 'Radiohead - Inside My Head (with lyrics)'
    end
  end
end

