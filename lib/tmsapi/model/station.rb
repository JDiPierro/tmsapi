require 'tmsapi/model/image'

module TMSAPI
  module Model
    class Station < Base
      attribute :preferred_image, TMSAPI::Model::Image
      attribute :call_sign, String
      attribute :stationId, Integer
      
    end
  end
end