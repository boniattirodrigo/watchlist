class AssetsPriceUpdater
  def self.call
    new.call
  end

  def initialize; end
  private_class_method :new

  def call
    Asset.pluck(:symbol).each { |symbol| UpdateQuoteJob.perform_async(symbol) }
  end
end
