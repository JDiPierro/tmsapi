require 'tmsapi/resource/base'
require 'date'

module TMSAPI
  module Resource
    module Movie
      class Theatres < TMSAPI::Resource::Base
        
        def initialize(connection, options = {})
          super(connection, "v1")
        end
        
        def showings(params)
            params[:startDate] = Date.today unless params[:startDate]
            get(showings_path, params).each do |movie|
              TMSAPI::Model::Movie.new movie
            end
        end
        
        private
        
        def showings_path
          "#{alt_path}/showings"
        end
        
        def base_path
          "theatres"
        end
        
        def alt_path
          "movies"
        end
        
      end
    end
  end
end