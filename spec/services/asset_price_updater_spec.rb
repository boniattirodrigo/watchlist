require 'rails_helper'

RSpec.describe AssetsPriceUpdater do
  subject { AssetsPriceUpdater.call }
  let!(:assets) { create_list(:asset, 5) }

  it 'perform async jobs for each asset' do
    allow(UpdateQuoteJob).to receive(:perform_async)
    subject
    assets.each do |asset|
      expect(UpdateQuoteJob).to have_received(:perform_async).with(asset.symbol)
    end
  end
end
