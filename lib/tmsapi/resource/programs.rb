require 'tmsapi/model/program'
require 'tmsapi/model/airing'
require 'date'

module TMSAPI
  module Resource
    class Champions < Base

      def initialize(connection, options = {})
        super(connection, "v1")
      end

      def search(params)
        get(search_path, params).hits.map do |root|
          TMSAPI::Model::Program.new root.program
        end
      end
      
      def details(tms_id, params = nil)
        TMSAPI::Model::Program.new get(details_path(tms_id), params)
      end
      
      def airings(tms_id, params = nil)
        get(airings_path(tms_id), params).map do |airing|
          TMSAPI::Model::Airing.new airing
        end
      end
      
      def new_shows(params)
        if params[:startDateTime].nil?
          params[:startDateTime] = Time.now.strftime("%Y-%m-%dT%H:%MZ")
        end
        
        get(new_shows_path,params).each do |new_program|
          TMSAPI::Model::Airing.new new_program
        end
      end
      
      def new_shows_past_week(params = nil)
        if params.nil?
          start_date = Date.today - 7
          params = {:startDate => start_date.to_s}
        end
        get(new_shows_past_week_path,params).each do |new_program|
          TMSAPI::Model::Program.new new_program
        end
      end
      
      private

      def search_path
        "#{base_path}/search"
      end
      
      def details_path(tms_id)
        "#{base_path}/#{tms_id}"
      end
      
      def airings_path(tms_id)
        "#{details_path(tms_id)}/airings"
      end
      
      def new_shows_path
        "#{base_path}/newShowAirings"
      end
      
      def new_shows_past_week_path
        "#{base_path}/newShowsLastWeek"
      end
      
      def base_path
        "programs"
      end
    end
  end
end
