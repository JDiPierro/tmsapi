require 'tmsapi/model/team'
require 'tmsapi/model/image'

module TMSAPI
  module Model
    class Organization < Base
      attribute :organization_id, String
      attribute :organization_name, String
      attribute :preferred_image, TMSAPI::Model::Image
      attribute :teams, Array[TMSAPI::Model::Team]
    end
  end
end