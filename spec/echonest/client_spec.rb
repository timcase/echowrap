
require 'helper'

describe Echowrap::Client do

  subject do
    Echowrap::Client.new(:api_key => "AK", :consumer_key => "CK", :shared_secret => "SS")
  end

  context "with module configuration" do

    before do
      Echowrap.configure do |config|
        Echowrap::Configurable.keys.each do |key|
          config.send("#{key}=", key)
        end
      end
    end

    after do
      Echowrap.reset!
    end

    it "inherits the module configuration" do
      client = Echowrap::Client.new
      Echowrap::Configurable.keys.each do |key|
        expect(client.instance_variable_get(:"@#{key}")).to eq key
      end
    end

    context "with class configuration" do

      before do
        @configuration = {
          :connection_options => {:timeout => 10},
          :api_key => 'AK',
          :consumer_key => 'CK',
          :shared_secret => 'SS',
          :endpoint => 'http://tumblr.com/',
          :middleware => Proc.new{}
        }
      end

      context "during initialization" do
        it "overrides the module configuration" do
          client = Echowrap::Client.new(@configuration)
          Echowrap::Configurable.keys.each do |key|
            expect(client.instance_variable_get(:"@#{key}")).to eq @configuration[key]
          end
        end
      end

      context "after initialization" do
        it "overrides the module configuration after initialization" do
          client = Echowrap::Client.new
          client.configure do |config|
            @configuration.each do |key, value|
              config.send("#{key}=", value)
            end
          end
          Echowrap::Configurable.keys.each do |key|
            expect(client.instance_variable_get(:"@#{key}")).to eq @configuration[key]
          end
        end
      end

    end
  end

  describe "#connection" do
    it "looks like Faraday connection" do
      expect(subject.send(:connection)).to respond_to(:run_request)
    end
    it "memoizes the connection" do
      c1, c2 = subject.send(:connection), subject.send(:connection)
      expect(c1.object_id).to eq c2.object_id
    end
  end

end

