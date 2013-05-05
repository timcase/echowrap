require 'helper'

describe Echonest do

  after do
    Echonest.reset!
  end

  context "when delegating to a client" do

      before do
        Echonest.configure do |config|
          config.api_key = 'AK'
        end

        stub_get("/api/v4/song/search").
        with(:query => { :artist => 'radiohead'}).
          to_return(:body => fixture("search_songs.json"),
                    :headers => {:content_type => "application/json; charset=utf-8"})
      end

      it "requests the correct resource" do
        Echonest.song_search(:artist => 'radiohead')
        expect(a_get("/api/v4/song/search")
        .with(:query => {:artist => 'radiohead'}))
        .to have_been_made
      end

      it "returns the same results as a client" do
       expect(Echonest.song_search(:artist => 'radiohead')).to eq Echonest::Client.new.song_search(:artist => 'radiohead')
      end

      describe ".respond_to?" do
        it "delegates to Echonest::Client" do
          expect(Echonest.respond_to?(:song_search)).to be_true
        end
        it "takes an optional argument" do
          expect(Echonest.respond_to?(:client, true)).to be_true
        end
      end

      describe ".client" do
        it "returns a Echonest::Client" do
          expect(Echonest.client).to be_a Echonest::Client
        end

        context "when the options don't change" do
          it "caches the client" do
            expect(Echonest.client).to eq Echonest.client
          end
        end

        context "when the options change" do
          it "busts the cache" do
            client1 = Echonest.client
            Echonest.configure do |config|
              config.api_key = 'abc'
            end
            client2 = Echonest.client
            expect(client1).not_to eq client2
          end
        end
      end
  end
end
