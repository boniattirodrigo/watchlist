class Asset < ApplicationRecord
  validates :symbol, presence: true, uniqueness: true

  has_one :last_quote, -> { where(quotes: { current: true }) }, class_name: 'Quote'
  has_many :wallet_items

  scope :in_wallet, -> { left_joins(:wallet_items).distinct.where.not(wallet_items: { id: nil }) }
  scope :not_in_wallet, -> { left_joins(:wallet_items).distinct.where(wallet_items: { id: nil }) }
end
