require 'faraday'
require 'faraday_middleware'

module ExcusesApi
  class Client
    BASE_URL = "https://excuser-three.vercel.app/v1/".freeze
    attr_reader :adapter

    def initialize(adapter: Faraday.default_adapter)
      @adapter = adapter
    end

    def get(path:, params:)
      Faraday.get(BASE_URL + path + params)
    end
    # def connection
    #   @connection ||= Faraday.new do |conn|
    #     conn.url_prefix = BASE_URL, 
    #     conn.request :json
    #     conn.response :json, content_type: "application/json" 
    #     conn.adapter adapter
    #   end
    # end
  end 
end