require 'rails_helper'

RSpec.describe Asset, type: :model do
  let!(:user) { create(:user) }
  let!(:wallet) { create(:wallet, user: user) }
  let!(:assets) { create_list(:asset, 5) }
  let!(:wallet_items) do
    create(:wallet_item, asset: assets.first, wallet: wallet)
    create(:wallet_item, asset: assets.second, wallet: wallet)
  end

  it 'return asset in wallets' do
    expect(Asset.in_wallet.to_a).to match_array(assets[..1])
  end
  it 'returns assets not in wallets' do
    expect(Asset.not_in_wallet.to_a).to match_array(assets[2..])
  end
end
