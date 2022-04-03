class Quote < ApplicationRecord
  has_many :alerts, dependent: :destroy
  belongs_to :asset

  validates :price, presence: true
end
