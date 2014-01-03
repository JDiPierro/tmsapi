require 'tmsapi/model/image'

module TMSAPI
  module Model
    class SportOrganization < Base
      attribute :organization_name, String
      attribute :organization_id, String
      attribute :preferred_image, TMSAPI::Model::Image
    end
  end
end