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
      to_return(:body => fixture("artist_blogs.json"),
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
        to_return(:body => fixture("artist_extract.json"),
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
      to_return(:body => fixture("artist_familiarity.json"),
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
      expect(familiarity).to be_an Echonest::Familiarity
      expect(familiarity.id).to eq 'ARH6W4X1187B99274F'
    end
  end

  describe '#artist_hotttnesss' do
    before do
      stub_get("/api/v4/artist/hotttnesss").
      with(:query => {:id => 'ARH6W4X1187B99274F'}).
      to_return(:body => fixture("artist_hotttnesss.json"),
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
      expect(hotttnesss).to be_an Echonest::Hotttnesss
      expect(hotttnesss.id).to eq 'ARH6W4X1187B99274F'
    end
  end

  describe '#artist_images' do
    before do
      stub_get("/api/v4/artist/images").
      with(:query => {:id => 'ARH6W4X1187B99274F'}).
      to_return(:body => fixture("artist_images.json"),
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
      to_return(:body => fixture("artist_list_genres.json"),
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
      to_return(:body => fixture("artist_list_terms.json"),
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
      to_return(:body => fixture("artist_news.json"),
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
                       :bucket => ['biographies',
                                   'blogs',
                                   'familiarity',
                                   'hotttnesss',
                                   'images',
                                   'news',
                                   'reviews',
                                   'terms',
                                   'urls',
                                   'video',
                                   'id:musicbrainz']}).
      to_return(:body => fixture("artist_profile.json"),
                 :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests the correct resource" do
      @client.artist_profile(:id => 'ARH6W4X1187B99274F',
                             :bucket => ['biographies',
                                         'blogs',
                                         'familiarity',
                                         'hotttnesss',
                                         'images',
                                         'news',
                                         'reviews',
                                         'terms',
                                         'urls',
                                         'video',
                                         'id:musicbrainz'])
      expect(a_get("/api/v4/artist/profile").
      with(:query => {:id => 'ARH6W4X1187B99274F',
                       :bucket => ['biographies',
                                   'blogs',
                                   'familiarity',
                                   'hotttnesss',
                                   'images',
                                   'news',
                                   'reviews',
                                   'terms',
                                   'urls',
                                   'video',
                                   'id:musicbrainz']})).
      to have_been_made
    end

    it "returns an artist" do
      artist = @client.artist_profile(:id => 'ARH6W4X1187B99274F',
                             :bucket => ['biographies',
                                         'blogs',
                                         'familiarity',
                                         'hotttnesss',
                                         'images',
                                         'news',
                                         'reviews',
                                         'terms',
                                         'urls',
                                         'video',
                                         'id:musicbrainz'])
      expect(artist).to be_a Echonest::Artist
      expect(artist.id).to eq 'ARH6W4X1187B99274F'
    end

     it 'returns an artist with biographies' do
       artist = @client.artist_profile(:id => 'ARH6W4X1187B99274F',
                              :bucket => ['biographies',
                                          'blogs',
                                          'familiarity',
                                          'hotttnesss',
                                          'images',
                                          'news',
                                          'reviews',
                                          'terms',
                                          'urls',
                                          'video',
                                          'id:musicbrainz'])
       expect(artist.biographies).to be_an Array
       expect(artist.biographies.first.site).to eq 'trouserpress'
     end

     it 'returns an artist with blogs' do
       artist = @client.artist_profile(:id => 'ARH6W4X1187B99274F',
                              :bucket => ['biographies',
                                          'blogs',
                                          'familiarity',
                                          'hotttnesss',
                                          'images',
                                          'news',
                                          'reviews',
                                          'terms',
                                          'urls',
                                          'video',
                                          'id:musicbrainz'])
       expect(artist.blogs).to be_an Array
       expect(artist.blogs.first.id).to eq '30fc8108d77316c6789140bef92ecc09'
     end

     it 'returns an artist with images' do
       artist = @client.artist_profile(:id => 'ARH6W4X1187B99274F',
                              :bucket => ['biographies',
                                          'blogs',
                                          'familiarity',
                                          'hotttnesss',
                                          'images',
                                          'news',
                                          'reviews',
                                          'terms',
                                          'urls',
                                          'video',
                                          'id:musicbrainz'])
       expect(artist.images).to be_an Array
       expect(artist.images.first.url).to eq 'http://userserve-ak.last.fm/serve/_/102639.jpg'
     end
  end

  describe '#artist_reviews' do
    before do
      stub_get("/api/v4/artist/reviews").
      with(:query => {:id => 'ARH6W4X1187B99274F'}).
      to_return(:body => fixture("artist_reviews.json"),
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
        to_return(:body => fixture("artist_search.json"),
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
      to_return(:body => fixture("artist_songs.json"),
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
        to_return(:body => fixture("artist_similar.json"),
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

  end
end

