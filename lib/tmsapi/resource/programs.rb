require 'tmsapi/model/program'
require 'tmsapi/model/airing'

module TMSAPI
  module Resource
    class Champions < Base

      def initialize(connection, options = {})
        super(connection, "v1")
      end

      def search(params)
        get(search_path(params[:tms_id]), params).hits.map do |root|
          TMSAPI::Model::Program.new root.program
        end
      end
      
      def details(params)
        TMSAPI::Model::Program.new get(details_path, params)
      end
      
      def airings(params)
        get(airings_path(params[:tms_id]), params).map do |airing|
          TMSAPI::Model::Airing.new airing
        end
      end

      private

      def search_path
        "#{base_path}/search"
      end
      
      def details_path(tms_id)
        "#{base_path}/#{tms_id}"
      end

      def base_path
        "programs"
      end
    end
  end
end
