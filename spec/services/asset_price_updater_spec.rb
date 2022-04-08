require 'rails_helper'

RSpec.describe AssetsPriceUpdater do
  subject { AssetsPriceUpdater.call }

  describe 'with 2 assets being used in wallet and 3 dont' do
    let!(:user) { create(:user) }
    let!(:wallet) { create(:wallet, user: user) }
    let!(:assets) { create_list(:asset, 5) }
    let!(:wallet_items) do
      create(:wallet_item, asset: assets.first, wallet: wallet)
      create(:wallet_item, asset: assets.second, wallet: wallet)
    end

    before(:each) do
      allow(UpdateQuoteJob).to receive(:perform_async)
      allow(UpdateQuoteJob).to receive(:set).and_return(UpdateQuoteJob)
    end

    it 'perform async jobs for each asset' do
      subject

      assets.each do |asset|
        expect(UpdateQuoteJob).to have_received(:perform_async).with(asset.symbol)
      end
    end

    it 'sends 2 jobs to in_wallet queue' do
      subject
      expect(UpdateQuoteJob).to have_received(:set).exactly(2).times.with(queue: :in_wallet)
    end

    it 'sends 3 jobs to default queue' do
      subject
      expect(UpdateQuoteJob).to have_received(:set).exactly(3).times.with(queue: :default)
    end
  end
end
