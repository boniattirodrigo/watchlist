class CreateQuotes < ActiveRecord::Migration[7.0]
  def change
    create_table :quotes, id: :uuid do |t|
      t.integer :price, null: false
      t.boolean :current, null: false, default: false
      t.references :asset, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
