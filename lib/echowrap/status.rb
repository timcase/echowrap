require 'echowrap/base'

module Echowrap
  class Status < Echowrap::Base
    attr_reader :details, :items_updated, :percent_complete, :ticket_status, :total_items

    def update_info
      @update_info ||= map_collection(Echowrap::UpdateInfo, :update_info)
    end

  end
end
