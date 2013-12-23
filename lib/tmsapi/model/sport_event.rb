require 'tmsapi/model/team'

module TMSAPI
  module Model
    class SportEvent < Program
      attribute :event_title, String
      attribute :game_date, String
      attribute :teams, Array[TMSAPI::Model::Team]
    end
  end
end