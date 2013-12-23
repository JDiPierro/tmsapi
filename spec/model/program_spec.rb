require 'spec_helper'

describe TMSAPI::Model::Program do
  
  let(:prog) { build(:program) }
  
  it 'should be filled with data' do
    prog.respond_to?(:tms_id).should be_true
    prog.respond_to?(:root_id).should be_true
    prog.respond_to?(:series_id).should be_true
    prog.respond_to?(:active).should be_true
    prog.respond_to?(:title).should be_true
    prog.respond_to?(:title_lang).should be_true
    prog.respond_to?(:short_description).should be_true
    prog.respond_to?(:long_description).should be_true
    prog.respond_to?(:ratings).should be_true
    prog.ratings.first.respond_to?(:body).should be_true
    prog.ratings.first.respond_to?(:code).should be_true
    prog.respond_to?(:genres).should be_true
    prog.genres.count.should be >= 3
    prog.respond_to?(:recommendations).should be_true
    prog.recommendations.first.respond_to?(:tms_id).should be_true
    prog.respond_to?(:top_cast).should be_true
    prog.respond_to?(:orig_air_date).should be_true
    prog.respond_to?(:preferred_image).should be_true
    prog.preferred_image.respond_to?(:uri).should be_true
    prog.respond_to?(:sub_type).should be_true
    prog.respond_to?(:total_seasons).should be_true
    prog.respond_to?(:total_episodes).should be_true
    prog.respond_to?(:entity_type).should be_true
  end
  
end