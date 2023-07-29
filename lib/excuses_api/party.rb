module ExcusesApi
  class Party
    # def initialize(category: 'party')
    #   @category = category
    # end
    
    def random_excuse
      client.get(url: "/#{@category}")
    end
    
    
    private

    def client
      @client ||= ExcusesApi::Client.new
    end
  end 
end