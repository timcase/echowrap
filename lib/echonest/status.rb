require 'echonest/base'

module Echonest
  class Status < Echonest::Base
    attr_reader :details, :items_updated, :percent_complete, :ticket_status, :total_items

    def update_info
      @update_info ||= map_collection(Echonest::UpdateInfo, :update_info)
    end

  end
end
