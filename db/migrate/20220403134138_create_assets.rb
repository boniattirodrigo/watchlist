class CreateAssets < ActiveRecord::Migration[7.0]
  def change
    create_table :assets, id: :uuid do |t|
      t.string :symbol, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
