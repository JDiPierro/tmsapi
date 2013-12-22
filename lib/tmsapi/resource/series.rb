module TMSAPI
  module Resource
    class Series < Base
      
      def initialize(connection, options = {})
        super(connection, "v1")
      end
      
      def details(series_id, params = nil)
        TMSAPI::Model::Series.new get(details_path(series_id), params)
      end
      
      def airings(series_id, params)
        get(airings_path(series_id),params).each do |airing|
          TMSAPI::Model::Airing.new airing
        end
      end
      
      def episodes(series_id, params = nil)
        get(episodes_path(series_id), params).each do |episode|
          TMSAPI::Model::Episode.new episode
        end
      end
      
      private
      
      def details_path(series_id)
        "#{base_path}/#{series_id}"
      end
      
      def airings_path(series_id)
        "#{details_path(series_id)}/airings"
      end
      
      def episodes_path(series_id)
        "#{details_path(series_id)}/episodes"
      end
      
      def base_path
        "series"
      end
      
    end
  end
end