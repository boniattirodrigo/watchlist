class Asset < ApplicationRecord
  validates :symbol, presence: true, uniqueness: true

  has_one :last_quote, -> { where(quotes: { current: true }) }, class_name: 'Quote'
end
