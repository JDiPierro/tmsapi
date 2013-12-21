module TMSAPI
  module Model
    class Recommendation < Base
      attribute :tms_id, String
      attribute :root_id, Integer
      attribute :title, String
    end
  end
end