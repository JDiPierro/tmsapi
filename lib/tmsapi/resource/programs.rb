require "tmsapi/model/program"

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

      private

      def search_path
        "#{base_path}/search"
      end

      def base_path
        "programs"
      end
    end
  end
end
