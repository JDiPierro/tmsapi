require 'spec_helper'

describe TMSAPI do
  it 'should have a version number' do
    TMSAPI::VERSION.should_not be_nil
  end
end