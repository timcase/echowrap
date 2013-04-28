require 'helper'

describe Echonest do

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
