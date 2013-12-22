require 'tmsapi/model/rating'
require 'tmsapi/model/recommendation'
require 'tmsapi/model/image'
require 'tmsapi/model/award'

module TMSAPI
  module Model
    class Series < Base
      attribute :tms_id, String
      attribute :root_id, Integer
      attribute :series_id, Integer
      attribute :title, String
      attribute :title_lang, String
      attribute :short_description, String
      attribute :long_description, String
      attribute :description_lang, String
      attribute :ratings, Array[TMSAPI::Model::Rating]
      attribute :genres, Array[String]
      attribute :recommendations, Array[TMSAPI::Model::Recommendation]
      attribute :orig_air_date, String
      attribute :preferred_image, TMSAPI::Model::Image
      attribute :sub_type, String
      attribute :awards, Array[TMSAPI::Model::Award]
      #attribute :keywords, WUT
      attribute :total_seasons, Integer
      attribute :total_episodes, Integer
      attribute :entity_type, String
      
    end
  end
end