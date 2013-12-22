require 'tmsapi/model/program'
require 'tmsapi/model/showtime'

module TMSAPI
  module Model
    class Movie < Program
      attribute :release_year, Integer
      attribute :quality_rating, TMSAPI::Model::Quality_Rating
      attribute :run_time, String
      attribute :showtimes, Array[TMSAPI::Model::Showtime]
    end
  end
end
