# TMS API

[![Build Status](https://travis-ci.org/JDiPierro/tmsapi.png?branch=master)](https://travis-ci.org/JDiPierro/tmsapi)
[![Coverage Status](https://coveralls.io/repos/JDiPierro/tmsapi/badge.png?branch=master)](https://coveralls.io/r/JDiPierro/tmsapi?branch=master)
[![Dependency Status](https://gemnasium.com/JDiPierro/tmsapi.png)](https://gemnasium.com/JDiPierro/tmsapi)

A Ruby wrapper around connecting to the [TMS API](https://developer.tmsapi.com)

This is my first project in Ruby so I'm using [petems/riot_api](https://github.com/petems/riot_api/) as a template.

## Installation

Add this line to your application's Gemfile

```ruby
gem 'tmsapi'
```

and then execute:

```ruby
bundle
```

or install it yourself with:

```ruby
gem install tmsapi
```

## Usage:

You'll need to get an API key from [http://developer.tmsapi.com/](http://developer.tmsapi.com/).

The free Public key has access to the following methods:

movies.theatres.showings

movies.tv.airings

programs.new_shows

sports.event_airings


```ruby
require 'tmsapi'

# Create Instace of the API
tms = TMSAPI::API.new :api_key => 'API_KEY_HERE'

# Get all movie showtimes for Austin Texas
movie_showings = tms.movies.theatres.showings({ :zip => "78701" })

# Print out the movie name, theatre name, and date/time of the showing.
movie_showings.each do |movie|
  movie.showtimes.each do |showing|
    puts "#{movie.title} is playing at '#{showing.theatre.name}' at #{showing.date_time}."
  end
end

# 12 Years a Slave is playing at 'Violet Crown Cinema' at 2013-12-23T12:45.
# A Christmas Story is playing at 'Alamo Drafthouse at the Ritz' at 2013-12-23T16:00.
# American Hustle is playing at 'Violet Crown Cinema' at 2013-12-23T11:00.
# American Hustle is playing at 'Violet Crown Cinema' at 2013-12-23T13:40.
# American Hustle is playing at 'Violet Crown Cinema' at 2013-12-23T16:20.
# American Hustle is playing at 'Violet Crown Cinema' at 2013-12-23T19:00.
# American Hustle is playing at 'Violet Crown Cinema' at 2013-12-23T21:40.
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Testing

```shell
bundle install
```

If adding new test:

```shell
RECORDING=1 TMS_API_KEY=your-api-key rspec
```

If running existing tests:

```shell
rspec
```
