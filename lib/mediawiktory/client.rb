module MediaWiktory
  class Client
    attr_reader :url
    
    def initialize(url)
      @url = Addressable::URI.parse(url)
      @faraday = Faraday.new(url)
    end

    def get(params)
      @faraday.get('', params).body
    end

    def post(params)
      @faraday.post('', params).body
    end
  end
end