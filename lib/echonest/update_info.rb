require 'echonest/identity'

module Echonest
  class UpdateInfo < Echonest::Identity
    attr_reader :info, :item_id
    
    def id
      "item-#{self.item_id}"
    end
  end
end
