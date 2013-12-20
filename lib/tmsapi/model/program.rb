require "tmsapi/model/image"

module TMSAPI
  module Model
    class Program < Base
      attribute :tms_id, String
      attribute :root_id, Integer
      attribute :active, Boolean
      attribute :title, String
      attribute :long_description, String
      attribute :description_lang, String
      attribute :genres, Array[String]
      attribute :top_cast, Array[String]
      attribute :orig_air_date, String
      attribute :preferred_image, TMSAPI::Model::Image
      attribute :entity_type, String
      
    end
  end
end
