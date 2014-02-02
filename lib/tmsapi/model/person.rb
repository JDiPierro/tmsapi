require 'tmsapi/model/credit'

module TMSAPI
  module Model
    class Person < Base
      attribute :person_id, Integer
      attribute :name_id, Integer
      attribute :entity_type, String
      attribute :name, String
      attribute :birth_place, String
      attribute :gender, String
      attribute :preferred_image, TMSAPI::Model::Image
      attribute :awards, Array[TMSAPI::Model::Award]
      attribute :credits, Array[TMSAPI::Model::Credit]
      attribute :birth_date, String
      attribute :role, String
      attribute :character_name, String
      attribute :billing_order, Integer
    end
  end
end