require 'helper'

describe Echowrap::Error do
  before do
    @client = new_test_client
  end

  describe "#initialize" do
    it "wraps another error class" do
      begin
        raise Faraday::Error::ClientError.new("Oops")
      rescue Faraday::Error::ClientError
        begin
          raise Echowrap::Error
        rescue Echowrap::Error => error
          expect(error.message).to eq "Oops"
          expect(error.wrapped_exception.class).to eq Faraday::Error::ClientError
        end
      end
    end
  end

  describe "#from_response" do

    before do
      stub_get("/api/v4/song/search").
      with(:query => {
            :results => 1,
            :artist => 'radiohead',
            :title => 'karma police',
            :bucket => ['fakebucket']}).
        to_return(:status => 400,
                  :body => fixture('error_response.json'))
    end

    it "should return echowrap badrequest when 400 is returned" do
     expect{@client.song_search(:results => 1,
                          :artist => 'radiohead',
                          :title => 'karma police',
                          :bucket => ['fakebucket'])}.to raise_error(Echowrap::Error::BadRequest)

    end

    it "returns an error with the echonest message parsed correctly" do
      begin
       @client.song_search(:results => 1,
                            :artist => 'radiohead',
                            :title => 'karma police',
                            :bucket => ['fakebucket'])
      rescue Echowrap::Error::BadRequest => error
        expect(error.message).to match(/bucket - Invalid parameter: bucket/)
      end
    end
  end



end
