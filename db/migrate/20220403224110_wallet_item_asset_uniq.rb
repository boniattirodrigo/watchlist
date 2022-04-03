class WalletItemAssetUniq < ActiveRecord::Migration[7.0]
  def change
    add_index :wallet_items, [:asset_id, :wallet_id], unique: true
  end
end
