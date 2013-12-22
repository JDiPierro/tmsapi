require 'tmsapi/resource/movies_tv'
require 'tmsapi/resource/movies_theatres'

module TMSAPI
  module Resource
    class Movies
      def initialize(connection)
        @connection = connection
      end
      
      def tv
        TMSAPI::Resource::Movie::TV.new @connection
      end
      
      def theatres
        TMSAPI::Resource::Movie::Theatres.new @connection
      end
      
    end
  end
end