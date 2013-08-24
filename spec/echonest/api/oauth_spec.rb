require 'helper'

describe Echowrap::API::Oauth do
  before do
    @client = new_test_client
  end

  describe "#oauth_timestamp" do

    before do
      stub_get("/api/v4/oauth/timestamp").
      to_return(:body => fixture("oauth/timestamp.json"),
                :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "requests the correct resource" do
      @client.oauth_timestamp
      expect(a_get("/api/v4/oauth/timestamp"))
      .to have_been_made
    end

    it "returns timestamp" do
      timestamp = @client.oauth_timestamp
      expect(timestamp).to be_an Integer
      expect(timestamp).to eq 1369548063
    end

  end
end
