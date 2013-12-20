module TMSAPI
  module Model
    class Award < Base
      attribute :award_id, Integer
      attribute :award_name, String
      attribute :category, String
      attribute :award_cat_id, Integer
      attribute :year, Integer
      attribute :recipient, String
      attribute :person_id, Integer
    end
  end
end