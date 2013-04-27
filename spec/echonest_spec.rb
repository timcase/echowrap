require 'helper'

describe Echonest do

  describe ".client" do
    it "returns a Echonest::Client" do
      expect(Echonest.client).to be_a Echonest::Client
    end

    # context "when the options don't change" do
    #   it "caches the client" do
    #     expect(Twitter.client).to eq Twitter.client
    #   end
    # end

    # context "when the options change" do
    #   it "busts the cache" do
    #     client1 = Twitter.client
    #     Twitter.configure do |config|
    #       config.consumer_key = 'abc'
    #       config.consumer_secret = '123'
    #     end
    #     client2 = Twitter.client
    #     expect(client1).not_to eq client2
    #   end
    # end
  end
end
