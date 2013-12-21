require 'spec_helper'

describe TMSAPI::API, :vcr do
  subject { client = TMSAPI::API.new :api_key => api_key, :debug => false}
  let(:api_key)   { API_KEY }
  
  describe '#programs'
  
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
    
    desribe '#find' do
      let(:lineups) {
        subject.lineups.find({:zipCode => "12804"})
      }
      
      it 'should find local lineups' do
        lineups.count.should be >= 15
        
        lineups.first.respond_to?(:lineup_id).should be_true
        lineups.first.respond_to?(:name).should be_true
        lineups.first.respond_to?(:location).should be_true
    end
    
  end
  
end