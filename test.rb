require 'tmsapi'

test = TMSAPI::API.new :api_key => 'awtthn4hrz46u8utfkxsfm5k', :debug => true

programs = test.programs.search({ :q => "Simpsons, The" , :queryFields => "title", :entityType => "show"})

programs.each do |program|
  puts "TMS ID: " + program.tms_id.to_s
end

prog = test.programs.details({:tms_id => "SH006883590000"})

puts "Title: " + prog.title
