# TMS API

[![Build Status](https://travis-ci.org/JDiPierro/tmsapi.png?branch=master)](https://travis-ci.org/JDiPierro/tmsapi)
[![Coverage Status](https://coveralls.io/repos/JDiPierro/tmsapi/badge.png?branch=master)](https://coveralls.io/r/JDiPierro/tmsapi?branch=master)
[![Dependency Status](https://gemnasium.com/JDiPierro/tmsapi.png)](https://gemnasium.com/JDiPierro/tmsapi)

A Ruby wrapper around connecting to the [TMS API](https://developer.tmsapi.com)

This is my first project in Ruby so I'm using [petems/riot_api](https://github.com/petems/riot_api/) as a template.

## Installation

Not yet published to Rubygems

## Usage:

You'll need to get an API key from [http://developer.tmsapi.com/](http://developer.tmsapi.com/).

The free Public key has access to the following methods:

movies.theatres.showings

movies.tv.airings

programs.new_shows

sports.events.airings (Not Yet Implemented)


```ruby
require 'tmsapi'

# Create Instace of the API
client = TMSAPI::API.new :api_key => 'API_KEY_HERE', :debug => true

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