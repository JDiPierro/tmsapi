require 'tmsapi/model/program'
require 'tmsapi/model/station'

module TMSAPI
  module Model
    class Airing < Base
      attribute :start_time, String
      attribute :endTime, String
      attribute :duration, Integer
      attribute :qualifiers, Array[String]
      attribute :channels, Array[String]
      attribute :stations, TMSAPI::Model::Station 
      attribute :station_id, Integer
      attribute :program, TMSAPI::Model::Program
    
    end
  end
end