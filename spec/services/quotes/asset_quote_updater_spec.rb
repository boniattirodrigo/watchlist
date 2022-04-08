require 'rails_helper'

module Quotes
  RSpec.describe AssetQuoteUpdater do
    let!(:asset) { create(:asset) }
    subject { described_class.call(asset.symbol) }

    before do
      allow(CurrentAssetQuoteGetter).to receive_messages(call: 100)
    end

    it 'updates asset quote' do
      expect { subject }.to change(Quote, :count).by(1)
    end

    describe 'with a quote already added' do
      let!(:quote) { create(:quote, asset: asset) }

      it 'adds new quote as current' do
        expect { subject }.to change(Quote, :count).by(1)
      end

      it 'changes old quote current to false' do
        expect { subject }.to change { quote.reload.current }
      end
    end
  end
end
