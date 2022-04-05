module Quotes
  class CurrentAssetQuoteGetter
    def self.call(asset_code)
      new(asset_code).call
    end

    def initialize(asset_code)
      @asset_code = asset_code
    end
    private_class_method :new

    def call
      StatusInvestScrapper.quote_for(@asset_code)
    rescue ScrapperBase::RequestFailed
      InfoMoneyScrapper.quote_for(@asset_code)
    end
  end
end
