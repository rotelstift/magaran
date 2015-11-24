class CreateCarriages < ActiveRecord::Migration
  def change
    create_table :carriages do |t|
      t.references :magazine, index: true, foreign_key: true
      t.references :comic, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
