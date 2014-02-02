require 'tmsapi/model/program'
require 'tmsapi/model/airing'
require 'tmsapi/model/event'
require 'date'

module TMSAPI
  module Resource
    class Celebrities < Base

      def initialize(connection, options = {})
        super(connection, "v1")
      end

      def details(person_id, params = nil)
        TMSAPI::Model::Person.new get(details_path(person_id), params)
      end
      
      private

      def details_path(person_id)
        "#{base_path}/#{person_id}"
      end
      
      def base_path
        "celebs"
      end
      
    end
  end
end
