require 'helper'

describe Echowrap do

  after do
    Echowrap.reset!
  end

  context "when delegating to a client" do

      before do
        Echowrap.configure do |config|
          config.api_key = 'AK'
        end

        stub_get("/api/v4/song/search").
        with(:query => { :artist => 'radiohead'}).
          to_return(:body => fixture("song/search.json"),
                    :headers => {:content_type => "application/json; charset=utf-8"})
      end

      it "requests the correct resource" do
        Echowrap.song_search(:artist => 'radiohead')
        expect(a_get("/api/v4/song/search")
        .with(:query => {:artist => 'radiohead'}))
        .to have_been_made
      end

      it "returns the same results as a client" do
       expect(Echowrap.song_search(:artist => 'radiohead')).to eq Echowrap::Client.new.song_search(:artist => 'radiohead')
      end

      describe ".respond_to?" do
        it "delegates to Echowrap::Client" do
          expect(Echowrap.respond_to?(:song_search)).to be_truthy
        end
        it "takes an optional argument" do
          expect(Echowrap.respond_to?(:client, true)).to be_truthy
        end
      end

      describe ".client" do
        it "returns a Echowrap::Client" do
          expect(Echowrap.client).to be_a Echowrap::Client
        end

        context "when the options don't change" do
          it "caches the client" do
            expect(Echowrap.client).to eq Echowrap.client
          end
        end

        context "when the options change" do
          it "busts the cache" do
            client1 = Echowrap.client
            Echowrap.configure do |config|
              config.api_key = 'abc'
            end
            client2 = Echowrap.client
            expect(client1).not_to eq client2
          end
        end
      end
  end
end
