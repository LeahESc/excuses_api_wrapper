require 'faraday'
require 'faraday_middleware'

module ExcusesApi
  class Client
    BASE_URL = "https://excuser-three.vercel.app/v1/excuse/".freeze
    # DEFAULT_HEADERS = {
    #   'Accept' => 'application/json',
    #   'Content-Type' => 'application/json'
    # }.freeze

    attr_reader :adapter

    def initialize(adapter: Faraday.default_adapter)
      @adapter = adapter
    end

    def get(path:, params: '')
      params = "/#{params}" unless params.empty?
      connection.get(BASE_URL + path + params).body
    end

    def connection
      @connection ||= Faraday.new(url: BASE_URL) do |config| 
        config.request :json
        config.response :json, content_type: "application/json" 
        config.adapter adapter
      end
    end
  end 
end