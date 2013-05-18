require 'echonest/identity'

module Echonest
    class CategoryMap < Echonest::Identity
      attr_reader :childrens, :christmas, :live, :studio
      
      def id
        'category map'
      end
    end
end
