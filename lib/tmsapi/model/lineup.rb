module TMSAPI
  module Model
    class Lineup < Base
      attribute :type, String
      attribute :lineup_id, String
      attribute :name, String
      attribute :device, String
      attribute :location, String
      
    end
  end
end