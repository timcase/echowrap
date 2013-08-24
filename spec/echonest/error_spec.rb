require 'helper'

describe Echowrap::Error do

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

end
