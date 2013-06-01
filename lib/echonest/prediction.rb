require 'echonest/base'

module Echonest
  class Prediction < Echonest::Base
    attr_reader :category, :results
  end
end
