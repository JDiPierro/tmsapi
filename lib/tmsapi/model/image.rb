require 'tmsapi/model/base'

module TMSAPI
  module Model
    class Image < Base
      attribute :uri, String
      attribute :height, Integer
      attribute :width, Integer
      attribute :primary, String
      attribute :category, String
      attribute :caption, Array[String]
      
    end
  end
end