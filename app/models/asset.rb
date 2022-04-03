class Asset < ApplicationRecord
  validates :symbol, presence: true, uniqueness: true

  has_many :quotes, dependent: :destroy
end
