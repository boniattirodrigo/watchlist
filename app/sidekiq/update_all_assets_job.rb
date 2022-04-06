# frozen_string_literal: true

require 'sidekiq-scheduler'

class UpdateAllAssetsJob
  include Sidekiq::Job

  def perform
    Asset.all.each do |item|
      UpdateAssetQuoteJob.perform_async(item.symbol)
    end
  end
end
