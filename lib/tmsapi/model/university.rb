require 'tmsapi/model/image'

module TMSAPI
  module Model
    class University < Base
      attribute :university_id, String
      attribute :university_name, String
      attribute :nick_name, String
      attribute :preferred_image, TMSAPI::Model::Image
    end
  end
end