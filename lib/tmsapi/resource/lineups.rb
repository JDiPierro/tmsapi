require 'tmsapi/model/lineup'

module TMSAPI
  module Resource
    class Lineups < Base
      
      def initialize(connection, options = {})
        super(connection, "v1")
      end
      
      def find(params)
        get(base_path,params).each do |lineup|
          TMSAPI::Model::Lineup.new lineup
        end
      end
      
      def details(lineup_id)
        TMSAPI::Model::Lineup.new get(details_path(lineup_id))
      end
      
      def channels(lineup_id, params = nil)
        get(channels_path(lineup_id),params).each do |station|
          TMSAPI::Model::Station.new station
        end
      end
      
      def stations(lineup_id, params = nil)
        channels(lineup_id,params)
      end
      
      def airings(lineup_id, params = nil)
        if params.nil? 
          params = { :startDateTime => Time.now.strftime("%Y-%m-%dT%H:%MZ") }
        end
        get(airings_path(lineup_id),params).each do |station|
          TMSAPI::Model::Station_Airings.new station
        end
      end
      
      private
      
      def details_path(lineup_id)
        "#{base_path}/#{lineup_id}"
      end
      
      def channels_path(lineup_id)
        "#{details_path(lineup_id)}/channels"
      end
      
      def airings_path(lineup_id)
        "#{details_path(lineup_id)}/grid"
      end
      
      def base_path
        "lineups"
      end
      
    end
  end
end