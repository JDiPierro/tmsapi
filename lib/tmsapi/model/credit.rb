module TMSAPI
  module Model
    class Credit < Base
      attribute :root_id, Integer
      attribute :role, String
      attribute :character_name, String
      attribute :title, String
      attribute :tms_id, String
      attribute :year, Integer
      attribute :type, String
    end
  end
end