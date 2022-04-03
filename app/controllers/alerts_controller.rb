class AlertsController < ApplicationController
  before_action :authenticate_user!

  def index
    assets_id = Wallet.find_by(user_id: current_user.id).items.pluck(:asset_id)

    @alerts = Alert.joins(quote: :asset)
                   .where(quotes: { asset_id: assets_id })
                   .order(created_at: :desc)
  end
end
