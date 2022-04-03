class AlertsController < ApplicationController
  before_action :authenticate_user!

  def index
    @alerts = Alert.all
  end
end
