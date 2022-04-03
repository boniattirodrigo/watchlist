class WalletsController < ApplicationController
  before_action :authenticate_user!

  def index
    # assets_id = Wallet.find_by(user_id: current_user.id).items.pluck(:asset_id)
    # quotes = Quote.where(asset_id: assets_id)

    # @wallet = Wallet.find_by(user_id: current_user.id).includes(wallet_items: { asset })
    # @wallet = Wallet.includes(items: { asset: :quotes })
    #                 .find_by(user_id: current_user.id, wallet_items: { assets: { quotes: { current: true } } })
    @wallet = Wallet.includes(items: { asset: :last_quote }).find_by(user_id: current_user.id)
  end
end
