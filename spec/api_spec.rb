require 'spec_helper'

describe TMSAPI::API, :vcr do
  subject { ra = TMSAPI::API.new :api_key => api_key }
  let(:api_key)   { API_KEY }
  
  describe '#programs' do
    describe '#search' do
      let(:query) { "Simpsons, The" }
      let(:hits) {
        subject.programs.search(:query)
      }

      it 'should return a list of all champions' do
        champions.count.should be >= current_champion_count
        champions.first.respond_to?(:name).should be_true
      end
    end

  end
  
end