require 'tmsapi/resource/base'

module TMSAPI
  module Resource
    module Movie
      class TV < TMSAPI::Resource::Base
        
        def initialize(connection, options = {})
          super(connection, "v1")
        end
        
        def airings(params)
          params[:startDateTime] = Time.now.strftime("%Y-%m-%dT%H:%MZ") unless params[:startDateTime]
          
          get(airings_path, params).each do |airing|
            TMSAPI::Model::Airing.new airing
          end
        end
        
        private
        
        def airings_path
          "#{base_path}/airings"
        end
        
        def base_path
          "movies"
        end
        
      end
    end
  end
end