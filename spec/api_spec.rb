require 'spec_helper'

describe TMSAPI::API, :vcr do
  subject { client = TMSAPI::API.new :api_key => api_key}
  let(:api_key)   { API_KEY }
  
  describe '#programs', :vcr do
  
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
    
    describe '#new_this_week' do
      let(:new_programs) {
        subject.programs.new_this_week
      }
      
      it 'should have programs' do
        new_programs.count.should be >= 10
        
        new_programs.first.respond_to?(:tms_id).should be_true
        new_programs.first.respond_to?(:long_description).should be_true
      end
    end
    
  end
  
end