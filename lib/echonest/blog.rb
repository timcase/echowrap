require 'echonest/base'

module Echonest
  class Blog < Echonest::Base
    attr_reader :date_found, :date_posted, :name, :summary, :url
  end
end

