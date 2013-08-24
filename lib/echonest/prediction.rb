require 'echonest/base'

module Echowrap
  class Prediction < Echowrap::Base
    attr_reader :category, :results
  end
end
