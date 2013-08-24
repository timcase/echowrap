require 'echowrap/base'

module Echowrap
  class Blog < Echowrap::Base
    attr_reader :date_found, :date_posted, :id, :name, :summary, :url
  end
end

