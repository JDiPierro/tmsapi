require 'tmsapi/model/station'

module TMSAPI
  module Resource
    class Stations < Base
      
      def initialize(connection, options = {})
        super(connection, "v1")
      end
      
      def details(stationId, lineupId = nil)
        if lineupId then
          params = {:lineupId => lineupId}
        else
          params = nil
        end
        
        get(details_path(stationId),params).each do |station|
          TMSAPI::Model::Station.new station
        end
      end
      
      def airings(stationId, params)
        params = { :startDateTime => Time.now.strftime("%Y-%m-%dT%H:%MZ")} unless params
        
        get(airings_path(stationId),params).each do |airing|
          TMSAPI::Model::Airing.new airing
        end
      end
      
      private
      
      def details_path(stationId)
        "#{base_path}/#{stationId}"
      end
      
      def airings_path(stationId)
        "#{details_path(stationId)}/airings"
      end
      
      def base_path
        "stations"
      end
      
    end
  end
end