class UpdateAllAssetsQuoteJob
  include Sidekiq::Job

  def perform
    AssetsPriceUpdater.call
  end
end
