module TMSAPI
  module Model
    class Person < Base
      attribute :person_id, Integer
      attribute :name_id, Integer
      attribute :name, String
      attribute :role, String
      attribute :character_name, String
      attribute :billing_order, Integer
    end
  end
end