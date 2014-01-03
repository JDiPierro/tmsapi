require 'tmsapi/model/program'
require 'tmsapi/model/university'
require 'tmsapi/model/organization'
require 'tmsapi/model/sport_info'

module TMSAPI
  module Resource
    class Sports < Base
      
      def initialize(connection, options = {})
        super(connection, "v1")
      end
      
      def details(sports_id = 'all', params = nil)
        params = {} unless params
        #Include organizations by defailt.
        params[:includeOrg] = true unless params[:includeOrg]
        
        get(details_path(sports_id), params).each do |sport|
          TMSAPI::Model::SportInfo.new sport
        end
      end
      
      def event_airings(sports_id = 'all', params)
        params[:startDateTime] = Time.now.strftime("%Y-%m-%dT%H:%MZ") unless params[:startDateTime]
        
        get(event_airings_path(sports_id),params).each do |event|
          TMSAPI::Model::SportEvent.new event
        end
      end
      
      def nonevent_airings(sports_id = 'all', params)
        params[:startDateTime] = Time.now.strftime("%Y-%m-%dT%H:%MZ") unless params[:startDateTime]
        
        get(nonevent_airings_path(sports_id), params).each do |airing|
          TMSAPI::Model::Airing.new airing
        end
      end
      
      def universities(params = nil)
        params = {} unless params
        
        get(universities_path, params).each do |university|
          TMSAPI::Model::University.new university
        end
      end
      
      def organization_teams(organization_id, params = nil)
        get(organization_teams_path(organization_id), params).each do |org|
          TMSAPI::Model::Organization.new org
        end
      end
      
      def university_teams(university_id, params = nil)
        params = {} unless params
        params[:includeTeam] = true unless params[:includeTeam]
        
        get(university_teams_path(university_id),params).each do |team|
          TMSAPI::Model::Team.new team
        end
      end
      
      def team_details(team_brand_id, params = nil)
        get(team_details_path(team_brand_id), params).each do |team|
          TMSAPI::Model::Team.new team
        end
      end
      
      def team_airings(team_brand_id, params)
        params[:startDateTime] = Time.now.strftime("%Y-%m-%dT%H:%MZ") unless params[:startDateTime]
        
        get(team_airings_path(team_brand_id), params).each do |airing|
          TMSAPI::Model::Airing.new airing
        end
      end
      
      def organization_airings(organization_id, params)
        get(organization_airings_path(organization_id), params).each do |airing|
          TMSAPI::Model::Airing.new airing
        end
      end
      
      private

      def details_path(sports_id)
        "#{base_path}/#{sports_id}"
      end
      
      def event_airings_path(sports_id)
        "#{details_path(sports_id)}/events/airings"
      end
      
      def nonevent_airings_path(sports_id)
        "#{details_path(sports_id)}/non-events/airings"
      end
      
      def universities_path
        "#{base_path}/universities"
      end
      
      def organization_teams_path(organization_id)
        "#{base_path}/organizations/#{organization_id}"
      end
      
      def university_teams_path(university_id)
        "#{base_path}/universities/#{university_id}"
      end
      
      def team_details_path(team_brand_id)
        "#{base_path}/teams/#{team_brand_id}"
      end
      
      def team_airings_path(team_brand_id)
        "#{team_details_path(team_brand_id)}/airings"
      end
      
      def organization_airings_path(organization_id)
        "#{organization_teams_path(organization_id)}/airings"
      end
      
      def base_path
        "sports"
      end
      
    end
  end
end