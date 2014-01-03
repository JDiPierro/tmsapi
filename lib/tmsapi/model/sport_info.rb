require 'tmsapi/model/sport_organization'

module TMSAPI
  module Model
    class SportInfo < Base
      attribute :sports_id, String
      attribute :sports_name, String
      attribute :organizations, Array[TMSAPI::Model::SportOrganization]
    end
  end
end