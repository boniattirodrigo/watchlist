module Quotes
  class ScrapperBase
    class RequestFailed < StandardError; end
    class AssetSymbolNotFound < StandardError; end

    def self.quote_for_all
      supported_assets_symbols.map do |symbol|
        [symbol, quote_for(symbol)]
      end.to_h
    end

    def self.quote_for(asset_symbol)
      raise AssetSymbolNotFound unless supported_assets_symbols.include?(asset_symbol)
      res = HTTParty.get(quote_url(asset_symbol))
      raise RequestFailed unless res.code == 200
      parse_quote(res.body)
    end

    def self.quote_url(_asset_symbol)
      throw NotImplementedError
    end

    def self.parse_quote(_html)
      throw NotImplementedError
    end

    def self.supported_assets_symbols
      throw NotImplementedError
    end
  end
end
