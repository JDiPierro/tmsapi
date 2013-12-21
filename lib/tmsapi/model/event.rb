module TMSAPI
  module Model
    class Event < Base
      attribute :air_date, String
      attribute :event_code, String
      attribute :last_update, String
      attribute :program, TMSAPI::Model::Program
    end
  end
end