require 'spec_helper'

describe TMSAPI::Model::Program do
  
  let(:program) { create(:program) }
  
  it 'should have a TMS ID' do
    program.respond_to?(:tms_id).should be_true
  end
  
end