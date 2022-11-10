class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :quantity
      t.string :unit
      t.string :price
      t.references :invoice, null: false, foreign_key: true

      t.timestamps
    end
  end
end
