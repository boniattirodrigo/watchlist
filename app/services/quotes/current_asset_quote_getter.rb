module Quotes
  class CurrentAssetQuoteGetter
    def self.call(asset_symbol)
      new(asset_symbol).call
    end

    def initialize(asset_symbol)
      @asset_symbol = asset_symbol.to_sym
    end
    private_class_method :new

    def call
      StatusInvestScrapper.quote_for(@asset_symbol)
    rescue ScrapperBase::RequestFailed
      InfoMoneyScrapper.quote_for(@asset_symbol)
    end
  end
end
