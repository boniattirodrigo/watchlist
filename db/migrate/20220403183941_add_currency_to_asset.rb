class AddCurrencyToAsset < ActiveRecord::Migration[7.0]
  def change
    add_column :assets, :currency, :string, null: false
  end
end
