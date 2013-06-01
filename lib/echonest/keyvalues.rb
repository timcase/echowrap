require 'echonest/base'

module Echonest
  class Keyvalues < Echonest::Base
    attr_reader :cat_type, :is_active, :timestamp, :version
    
  end
end
