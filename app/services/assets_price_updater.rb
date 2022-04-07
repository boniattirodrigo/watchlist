class AssetsPriceUpdater
  def self.call
    new.call
  end

  def initialize; end
  private_class_method :new

  def call
    queues = {
      default: Asset.not_in_wallet.pluck(:symbol),
      in_wallet: Asset.in_wallet.pluck(:symbol)
    }

    queues.each do |queue, symbols|
      symbols.each do |symbol|
        UpdateQuoteJob.set(queue: queue).perform_async(symbol)
      end
    end
  end
end
