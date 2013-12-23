require 'tmsapi/model/program'
require 'tmsapi/model/station'
require 'tmsapi/model/rating'
require 'tmsapi/model/quality_rating'

module TMSAPI
  module Model
    class Airing < Base
      attribute :start_time, String
      attribute :endTime, String
      attribute :duration, Integer
      attribute :ratings, Array[TMSAPI::Model::Rating]
      attribute :qualifiers, Array[String]
      attribute :channels, Array[String]
      attribute :station, TMSAPI::Model::Station 
      attribute :station_id, Integer
      attribute :program, TMSAPI::Model::Program
      attribute :release_year, Integer
      attribute :quality_rating, TMSAPI::Model::QualityRating
      attribute :entity_type, String
    
    end
  end
end