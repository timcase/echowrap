require 'echonest/base'

module Echonest
  class NewsArticle < Echonest::Base
    attr_reader :date_found, :date_posted, :id, :name, :summary, :url
  end
end

