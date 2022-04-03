class CreateAlerts < ActiveRecord::Migration[7.0]
  def change
    create_table :alerts, id: :uuid do |t|
      t.text :message
      t.references :quote, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
