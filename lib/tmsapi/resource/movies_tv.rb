require 'tmsapi/resource/base'

module TMSAPI
  module Resource
    module Movie
      class TV < TMSAPI::Resource::Base
        
        def initialize(connection, options = {})
          super(connection, "v1")
        end
        
        private
        
        def base_path
          "movies"
        end
        
      end
    end
  end
end