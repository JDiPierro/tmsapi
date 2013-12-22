require 'tmsapi/model/caption'

module TMSAPI
  module Model
    class Image < Base
      attribute :uri, String
      attribute :height, Integer
      attribute :width, Integer
      attribute :primary, String
      attribute :category, String
      attribute :caption, Array[TMSAPI::Model::Caption]
      
    end
  end
end