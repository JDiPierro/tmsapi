require 'tmsapi/model/theatre'

module TMSAPI
  module Model
    class Showtime < Base
      attribute :theatre, TMSAPI::Model::Theatre
      attribute :barg, Boolean
      attribute :date_time, String
      attribute :ticket_uri, String
      attribute :quals, String
    end
  end
end