module ExcusesApi
  class PartyExcuse 
    attr_reader :id, :excuse, :category

    def initialize(category: "party")
      @category = category
    end
    
    # def self.find(category: "party")
    #   attributes = @client.get(path: category)
    #   new(attributes)
    # end

    def random 
      client.get(path: @category)
    end

    def batch(number: 10)
      client.get(path: @category, params: number.to_s)
    end
    
    private

    def client
      @client ||= ExcusesApi::Client.new
    end
  end 
end