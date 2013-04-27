require 'helper'

describe Echonest::Client do

  subject do
    Echonest::Client.new(:api_key => "AK", :consumer_key => "CK", :shared_secret => "SS")
  end

  context "with module configuration" do

    before do
      Echonest.configure do |config|
        Echonest::Configurable.keys.each do |key|
          config.send("#{key}=", key)
        end
      end
    end

    after do
      Echonest.reset!
    end

    it "inherits the module configuration" do
      client = Echonest::Client.new
      Echonest::Configurable.keys.each do |key|
        expect(client.instance_variable_get(:"@#{key}")).to eq key
      end
    end
  end
end
