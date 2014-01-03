require 'tmsapi/model/image'
require 'tmsapi/model/university'

module TMSAPI
  module Model
    class Team < Base
      attribute :name, String
      attribute :team_brand_id, Integer
      attribute :team_brand_name, String
      attribute :is_home, Boolean
      attribute :abbreviation, String
      attribute :nick_name, String
      attribute :proper_name, String
      attribute :sports_id, String
      attribute :preferred_image, TMSAPI::Model::Image
      attribute :university, TMSAPI::Model::University
    end
  end
end