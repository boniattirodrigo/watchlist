class UpdateQuoteJob
  include Sidekiq::Job
  sidekiq_options retry: 5

  sidekiq_retries_exhausted do |msg, _ex|
    Alert.create(message: "Failed to update quote price for '#{msg['args'][0]}': #{msg['error_message']}")
  end

  def perform(asset_symbol)
    Quotes::AssetQuoteUpdater.call(asset_symbol)
  end
end
