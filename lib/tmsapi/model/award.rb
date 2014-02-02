module TMSAPI
  module Model
    class Award < Base
      attribute :award_id, Integer
      attribute :root_id, Integer
      attribute :tms_id, String
      attribute :title, String
      attribute :award_name, String
      attribute :category, String
      attribute :award_cat_id, Integer
      attribute :year, Integer
      attribute :recipient, String
      attribute :person_id, Integer
    end
  end
end