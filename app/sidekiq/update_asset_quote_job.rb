# frozen_string_literal: true

class UpdateAssetQuoteJob
  include Sidekiq::Job
  sidekiq_options retry: 3

  def perform(asset_ticker, currency = 'BRL')
    asset = Asset.find_or_create_by(symbol: asset_ticker.upcase, currency: currency)
    asset_price = GetAssetQuoteService.call(asset_ticker)
    Quote.create(price: asset_price, current: true, asset_id: asset.id)
  end
end
