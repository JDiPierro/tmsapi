require "tmsapi/model/award"
require "tmsapi/model/image"
require "tmsapi/model/person"
require "tmsapi/model/rating"
require "tmsapi/model/recommendation"
require "tmsapi/model/team"

module TMSAPI
  module Model
    class Program < Base
      attribute :tms_id, String
      attribute :root_id, Integer
      attribute :series_id, Integer
      attribute :active, Boolean
      attribute :title, String
      attribute :title_lang, String
      attribute :short_description, String
      attribute :long_description, String
      attribute :description_lang, String
      attribute :ratings, Array[TMSAPI::Model::Rating]
      attribute :genres, Array[String]
      attribute :recommendations, Array[TMSAPI::Model::Recommendation]
      attribute :top_cast, Array[String]
      attribute :orig_air_date, String
      attribute :preferred_image, TMSAPI::Model::Image
      attribute :sub_type, String
      attribute :awards, Array[TMSAPI::Model::Award]
      attribute :cast, Array[TMSAPI::Model::Person]
      attribute :crew, Array[TMSAPI::Model::Person]
      #attribute :keywords, WUDUFUQ
      attribute :total_seasons, Integer
      attribute :total_episodes, Integer
      attribute :entity_type, String
      attribute :teams, Array[TMSAPI::Model::Team]
      
    end
  end
end
