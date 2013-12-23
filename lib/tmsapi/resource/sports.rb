require 'tmsapi/model/program'

module TMSAPI
  module Resource
    class Sports < Base
      
      def initialize(connection, options = {})
        super(connection, "v1")
      end
      
      def event_airings(sports_id, params)
        params[:startDateTime] = Time.now.strftime("%Y-%m-%dT%H:%MZ") unless params[:startDateTime]
        
        get(event_airings_path(sports_id),params).each do |event|
          TMSAPI::Model::SportEvent.new event
        end
      end
      
      private

      def details_path(sports_id)
        "#{base_path}/#{sports_id}"
      end
      
      def event_airings_path(sports_id)
        "#{details_path(sports_id)}/events/airings"
      end
      
      def base_path
        "sports"
      end
      
    end
  end
end