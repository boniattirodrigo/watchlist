# frozen_string_literal: true

class Quote < ApplicationRecord
  has_many :alerts, dependent: :destroy
  belongs_to :asset

  validates :price, presence: true

  before_save :update_current_column, if: :current

  private

  def update_current_column
    current_quote = Quote.where(asset_id: asset_id, current: true)
    return if current_quote.nil?

    current_quote.update_all(current: false)
  end
end
