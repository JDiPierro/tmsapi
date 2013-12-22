require File.expand_path('../middleware/custom_logger', __FILE__)

module TMSAPI
  class API

    # Creates a new TMS API client instance.
    #
    # @param [Hash] params
    # @option params [String] :api_key The api_key (required)
    #
    # @see [Faraday]
    def initialize(params)
      @api_key             = params[:api_key]
      @debug               = params[:debug]
      @ssl                 = params[:ssl] || { :verify => true }
      @base_url            = params[:base_url]            || "http://data.tmsapi.com/"
      @faraday_adapter     = params[:faraday_adapter]     || Faraday.default_adapter
      @raise_status_errors = params[:raise_status_errors] || true
      @faraday             = params[:faraday]             || default_faraday
      raise ArgumentError, ':api_key missing' unless @api_key
    end

    def programs
      TMSAPI::Resource::Programs.new(@faraday)
    end
    
    def stations
      TMSAPI::Resource::Stations.new(@faraday)
    end
    
    def lineups
      TMSAPI::Resource::Lineups.new(@faraday)
    end
    
    def series
      TMSAPI::Resource::Series.new(@faraday)
    end
    
    def movies
      TMSAPI::Resource::Movies.new(@faraday)
    end

    def default_faraday
      Faraday.new(:url => @base_url, :ssl => @ssl) do |faraday|
        faraday.use CustomLogger if @debug
        faraday.request  :url_encoded
        faraday.response :rashify
        faraday.response :json
        faraday.use Faraday::Response::RaiseError if @raise_status_errors
        faraday.adapter @faraday_adapter
        faraday.params['api_key'] = @api_key
        faraday.headers['User-Agent'] = "tmsapi rubygem v#{TMSAPI::VERSION}"
      end
    end

  end
end
