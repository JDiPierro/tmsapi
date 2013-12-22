require 'tmsapi/model/program'

module TMSAPI
  module Model
    class Episode < Program
      attribute :episode_title, String
      attribute :season_num, Integer
      attribute :episode_num, Integer
    end
  end
end