class WalletItem < ApplicationRecord
  belongs_to :wallet
  belongs_to :asset

  delegate :symbol, :last_quote, :currency, to: :asset

  def last_quote_price
    last_quote&.price || 0
  end
end
