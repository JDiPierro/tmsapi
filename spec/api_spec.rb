require 'spec_helper'

describe TMSAPI::API, :vcr do
  subject { client = TMSAPI::API.new :api_key => api_key, :debug => false}
  let(:api_key)   { API_KEY }
  
  describe '#programs' do
  
    describe '#search' do
      
      let(:programs) {
        subject.programs.search({ :q => "The Amazing World of Gumball", :queryFields => "title", :entityType => "show"})
      }

      it 'should find 4 programs' do
        programs.count.should be >= 4
        programs.first.respond_to?(:tms_id).should be_true
      end
    end
    
    describe '#details' do
      
      let(:details) {
        subject.programs.details("SH014122930000")
      }
      
      it 'should be filled with program information' do
        details.ratings.count.should be >= 1
        details.ratings.first.respond_to?(:body).should be_true
      
        details.respond_to?(:title).should be_true
        details.respond_to?(:long_description).should be_true
        details.respond_to?(:ratings).should be_true
        details.respond_to?(:series_id).should be_true
      end
      
    end
    
    describe '#airings' do
      let(:airings) {
        subject.programs.airings("SH014122930000", { :lineupId => "USA-NY31586-X", :startDateTime => "2013-12-21T17:30Z" })
      }
      
      it 'should find airings' do
        airings.count.should be >= 0
        
        airings.first.respond_to?(:start_time).should be_true
        airings.first.respond_to?(:duration).should be_true
      end
    end
    
    describe '#new_shows' do
      let(:new_program_airings) {
        subject.programs.new_shows({:startDateTime => "2013-12-21T13:34Z", :lineupId => "USA-NY31586-X"})
      }
      
      it 'should find new shows' do
        new_program_airings.count.should be >= 10
        
        new_program_airings.first.respond_to?(:program)
        new_program_airings.first.program.respond_to?(:tms_id)
      end
    end
    
    describe '#new_past_week' do
      let(:new_programs) {
        subject.programs.new_past_week({:startDate => "2013-12-21", :endDate => "2013-12-21"})
      }
      
      it 'should have programs' do
        new_programs.count.should be >= 10
        
        new_programs.first.respond_to?(:tms_id).should be_true
        new_programs.first.respond_to?(:long_description).should be_true
      end
    end
    
    describe '#advance_planner' do
      let(:events) {
        subject.programs.advance_planner({:startDate => "2013-12-22"})
      }
      
      it 'should list holiday events' do
        events.count.should be >= 10
        
        events.first.respond_to?(:air_date).should be_true
        events.first.respond_to?(:program).should be_true
        events.first.program.respond_to?(:tms_id).should be_true
      end
    end
    
    describe '#images' do
      let(:images) {
        subject.programs.images("SH014122930000")
      }
      
      it 'should return images' do
        images.count.should be >= 5
        images.first.respond_to?(:uri).should be_true
      end
    end
    
    describe '#genres' do
      let (:genres) {
        subject.programs.genres
      }
      
      it 'should return all genres' do
        genres.count.should be >= 10
      end
    end
    
  end
  
  describe '#stations' do
    
    describe '#details' do
      let(:stations) {
        subject.stations.details("10359")
      }
      
      it 'should get station details' do
        stations.count.should be >= 1
        
        stations.first.respond_to?(:station_id).should be_true
        stations.first.respond_to?(:name).should be_true
      end
    end
    
    describe '#airings' do
      let(:airings) {
        subject.stations.airings("10359", {:startDateTime => "2013-12-21T18:30Z"})
      }
      
      it 'should list airings' do
        airings.count.should be >= 4
        
        airings.first.respond_to?(:station_id).should be_true
      end
    end
    
  end
  
  describe '#lineups' do
    
    describe '#find' do
      let(:lineups) {
        subject.lineups.find({:postalCode => "12804"})
      }
      
      it 'should find local lineups' do
        lineups.count.should be >= 15
        
        lineups.last.respond_to?(:lineup_id).should be_true
        lineups.last.respond_to?(:name).should be_true
        lineups.last.respond_to?(:location).should be_true
      end
    end
    
    describe '#details' do
      let(:lineup) {
        subject.lineups.details("USA-NY31586-X")
      }
      
      it 'should tell me about the lineup' do
        lineup.respond_to?(:type).should be_true
        lineup.respond_to?(:name).should be_true
      end
      
    end
    
    describe '#channels' do
      let(:channels) {
        subject.lineups.channels("USA-NY31586-X")
      }
      
      it 'should list some channels' do
        channels.count.should be >= 3
        
        channels.first.respond_to?(:preferred_image).should be_true
        channels.first.preferred_image.respond_to?(:uri).should be_true
        channels.first.respond_to?(:call_sign).should be_true
      end
    end
    
    describe '#stations' do
      let(:stations) {
        subject.lineups.stations("USA-NY31586-X")
      }
      
      it 'should list some channels' do
        stations.count.should be >= 3
        
        stations.first.respond_to?(:preferred_image).should be_true
        stations.first.preferred_image.respond_to?(:uri).should be_true
        stations.first.respond_to?(:call_sign).should be_true
      end
    end
    
    describe '#airings' do
      let (:station_airings) {
        subject.lineups.airings("USA-NY31586-X", { :startDateTime => "2013-12-21T23:10Z" })
      }
      
      it 'should tell me whats airing' do
        station_airings.count.should be >= 10
        
        station_airings.first.respond_to?(:channel).should be_true
        station_airings.first.respond_to?(:call_sign).should be_true
        station_airings.first.respond_to?(:airings).should be_true
        
        station_airings.first.airings.count.should be >= 1
            
        station_airings.first.airings.first.respond_to?(:start_time).should be_true
        station_airings.first.airings.first.respond_to?(:end_time).should be_true
        station_airings.first.airings.first.respond_to?(:duration).should be_true
      end
    end
    
  end
  
  describe '#series' do
    
    describe '#details' do
      let(:series) {
        subject.series.details("185044")
      }
      
      it 'should find the series' do
        series.respond_to?(:tms_id).should be_true
        series.respond_to?(:title).should be_true
        series.respond_to?(:short_description).should be_true
        series.respond_to?(:total_seasons).should be_true
        series.respond_to?(:total_episodes).should be_true
      end
    end
    
    describe '#airings' do
      let(:airings) {
        subject.series.airings("185044",
          { :lineupId => "USA-NY31586-X",
            :startDateTime => "2013-12-22T15:30Z",
            :endDateTime => "2013-12-26T15:30Z"
            })
      }
      
      it 'should list airings' do
        airings.count.should be >= 10
        
        airings.first.respond_to?(:start_time).should be_true
        airings.first.respond_to?(:end_time).should be_true
        airings.first.respond_to?(:duration).should be_true
        airings.first.respond_to?(:station).should be_true
        airings.first.station.respond_to?(:call_sign).should be_true
        airings.first.station.respond_to?(:station_id).should be_true
      end
    end
    
    describe '#episodes' do
      let(:episodes) {
        subject.series.episodes("185044")
      }
      
      it 'should return episodes' do
        episodes.count.should be >= 10
        
        episodes.first.respond_to?(:tms_id).should be_true
        episodes.first.respond_to?(:title).should be_true
        episodes.first.respond_to?(:short_description).should be_true
        episodes.first.respond_to?(:episode_title).should be_true
        episodes.first.respond_to?(:season_num).should be_true
        episodes.first.respond_to?(:episode_num).should be_true
        
      end
    end
    
  end
  
  describe '#movies' do
    
    describe '#tv' do
      
      describe '#airings' do
        let(:airings) {
          subject.movies.tv.airings( { :lineupId => "USA-NY31586-X", :startDateTime => "2013-12-22T15:30Z" } )
        }
        
        it 'should tell me what movies are on tv' do
          airings.count.should be >= 10
          
          airings.first.respond_to?(:start_time).should be_true
          airings.first.respond_to?(:end_time).should be_true
          airings.first.respond_to?(:duration).should be_true
          airings.first.respond_to?(:channels).should be_true
          airings.first.channels.count.should be >= 1
          airings.first.respond_to?(:station).should be_true
          airings.first.station.respond_to?(:call_sign).should be_true
          airings.first.respond_to?(:program).should be_true
          airings.first.program.respond_to?(:tms_id).should be_true
          airings.first.program.respond_to?(:title).should be_true
        end
      end
      
      describe '#versions' do
        let(:versions) {
          subject.movies.tv.versions("3542039")
        }
        
        it 'should tell me about that movie' do
          versions.count.should be >= 5
          
          versions.first.respond_to?(:tms_id).should be_true
          versions.first.respond_to?(:title).should be_true
          versions.first.respond_to?(:short_description).should be_true

          versions.first.respond_to?(:ratings).should be_true
          versions.first.ratings.count.should be >= 5
          versions.first.ratings.respond_to?(:body).should be_true
          versions.first.ratings.respond_to?(:code).should be_true
        end
      end
      
    end
    
    describe '#theatres' do
      
      describe '#showings' do
        let(:showings) {
          subject.movies.theatres.showings({:startDate => "2013-12-22", :zip => "12804"})
        }
        
        it 'should get movie showings' do
          showings.count.should be >= 10
          
          showings.first.respond_to?(:release_year).should be_true
          showings.first.respond_to?(:run_time).should be_true
          showings.first.respond_to?(:showtimes).should be_true
          showings.first.showtimes.first.respond_to?(:date_time).should be_true
          showings.first.showtimes.first.respond_to?(:theatre).should be_true
          showings.first.showtimes.first.respond_to?(:quals).should be_true
          showings.first.showtimes.first.theatre.respond_to?(:id).should be_true
          showings.first.showtimes.first.theatre.respond_to?(:name).should be_true
        end
        
      end
      
    end
    
  end
  
end