require 'rails_helper'

RSpec.describe UpdateQuoteJob do
  let(:asset) { create(:asset) }

  it 'calls quote updater service' do
    allow(Quotes::AssetQuoteUpdater).to receive(:call)
    described_class.new.perform(asset.symbol)
    expect(Quotes::AssetQuoteUpdater).to have_received(:call).with(asset.symbol)
  end
end
