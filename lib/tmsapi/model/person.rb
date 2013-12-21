module TMSAPI
  module Model
    class Person < Base
      attribute :person_id, Integer
      attribute :name_Id, Integer
      attribute :name, String
      attribute :role, String
      attribute :characterName, String
      attribute :billingOrder, Integer
    end
  end
end