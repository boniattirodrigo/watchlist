class RemoveQuoteIdFromAlerts < ActiveRecord::Migration[7.0]
  def change
    remove_index :alerts, :quote_id
    remove_column :alerts, :quote_id
  end
end
