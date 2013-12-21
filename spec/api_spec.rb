require 'spec_helper'

describe TMSAPI::API, :vcr do
  subject { ra = TMSAPI::API.new :api_key => api_key }
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
    
  end
  
end