module TMSAPI
  module Resource
    class Base
      def initialize(connection, version, options = {})
        @connection = connection
        @version = version
      end

      def get(path, options={})
        @connection.get(full_path(path), options).body
      end

      private

      def full_path(path)
        "#{@version}/#{path}"
      end
    end
  end
end
