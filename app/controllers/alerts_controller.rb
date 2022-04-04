class AlertsController < ApplicationController
  before_action :authenticate_user!

  def index
    assets_id = current_user.wallet.items.pluck(:asset_id)

    @alerts = Alert.joins(quote: :asset)
                   .where(quotes: { asset_id: assets_id })
                   .order(created_at: :desc)
                   .limit(30)
  end
end
