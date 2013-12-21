require 'tmsapi/model/image'

module TMSAPI
  module Model
    class Station < Base
      attribute :stationId, Integer
      attribute :name, String
      attribute :call_sign, String
      attribute :type, String
      attribute :bcastLangs, Array[String]
      attribute :edLags, Array[String]
      attribute :channel, Integer
      attribute :preferred_image, TMSAPI::Model::Image
      
    end
  end
end