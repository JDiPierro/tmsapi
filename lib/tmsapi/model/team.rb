module TMSAPI
  module Model
    class Team < Base
      attribute :name, String
      attribute :team_brand_id, Integer
      attribute :is_home, Boolean
    end
  end
end