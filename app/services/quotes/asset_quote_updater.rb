module Quotes
  class AssetQuoteUpdater
    def self.call(asset_symbol)
      new(asset_symbol).call
    end

    def initialize(asset_symbol)
      @asset_symbol = asset_symbol
    end
    private_class_method :new

    def call
      price = CurrentAssetQuoteGetter.call(@asset_symbol)
      asset = Asset.find_by(symbol: @asset_symbol)
      asset.last_quote&.update(current: false)
      Quote.create(asset: asset, price: price, current: true)
    end
  end
end
