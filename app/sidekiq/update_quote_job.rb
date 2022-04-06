class UpdateQuoteJob
  include Sidekiq::Job

  def perform(asset_symbol)
    Quotes::AssetQuoteUpdater.call(asset_symbol)
  end
end
