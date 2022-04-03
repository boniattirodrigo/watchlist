class CreateWalletItems < ActiveRecord::Migration[7.0]
  def change
    create_table :wallet_items, id: :uuid do |t|
      t.references :wallet, null: false, foreign_key: true, type: :uuid
      t.references :asset, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
