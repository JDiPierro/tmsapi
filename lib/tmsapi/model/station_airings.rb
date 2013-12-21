require 'tmsapi/model/image'
require 'tmsapi/model/airing'

module TMSAPI
  module Model
    class Station_Airings < Base
      attribute :channel, Integer
      attribute :call_sign, String
      attribute :station_id, Integer
      attribute :preferred_image, TMSAPI::Model::Image
      attribute :airings, Array[TMSAPI::Model::Airing]
    end
  end
end