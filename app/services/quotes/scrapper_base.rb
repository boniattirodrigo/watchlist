module Quotes
  class ScrapperBase
    class RequestFailed < StandardError; end

    def self.quote_for_all
      assets_codes.map do |code|
        [code, quote_for(code)]
      end.to_h
    end

    def self.quote_for(asset_code)
      res = HTTParty.get(quote_url(asset_code))
      throw RequestFailed unless res.code == 200
      parse_quote(res.body)
    end

    def self.quote_url(_asset_code)
      throw NotImplementedError
    end

    def self.parse_quote
      throw NotImplementedError
    end

    def self.assets_codes
      throw NotImplementedError
    end
  end
end
