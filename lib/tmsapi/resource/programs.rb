require 'tmsapi/model/program'
require 'tmsapi/model/airing'
require 'tmsapi/model/event'
require 'date'

module TMSAPI
  module Resource
    class Programs < Base

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
        params[:startDateTime] = Time.now.strftime("%Y-%m-%dT%H:%MZ") unless params[:startDateTime]
        
        get(new_shows_path,params).each do |new_program|
          TMSAPI::Model::Airing.new new_program
        end
      end
      
      def new_past_week(params = nil)
        params = {:startDate => (Date.today - 7).to_s} unless params
        get(new_past_week_path,params).each do |new_program|
          TMSAPI::Model::Program.new new_program
        end
      end
      
      def advance_planner(params = nil)
        params = {:startDate => (Date.today + 1).to_s} unless params
        
        get(advance_planner_path,params).each do |event|
          TMSAPI::Model::Event.new event
        end
      end
      
      def images(resource_id, params = nil)
        get(images_path(resource_id), params).each do |image|
          TMSAPI::Model::Image.new image
        end
      end
      
      def genres
        get(genres_path)
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
      
      def new_past_week_path
        "#{base_path}/newShowsLastWeek"
      end

      def advance_planner_path
        "#{base_path}/advancePlanner"
      end
      
      def images_path(resource_id)
        "#{base_path}/#{resource_id}/images"
      end
      
      def genres_path
        "#{base_path}/genres"
      end
      
      def base_path
        "programs"
      end
      
    end
  end
end
