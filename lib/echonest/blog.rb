require 'echonest/identity'

module Echonest
    class Blog < Echonest::Identity
      attr_reader :date_found, :date_posted, :name, :summary, :url
    end
end

