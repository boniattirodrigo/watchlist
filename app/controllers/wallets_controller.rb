class WalletsController < ApplicationController
  before_action :authenticate_user!

  def index
    @wallet_items = WalletItem.includes(asset: :last_quote).where(wallet_id: current_user.wallet.id)
  end
end
