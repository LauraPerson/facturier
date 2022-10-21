class CreateSelectedClients < ActiveRecord::Migration[7.0]
  def change
    create_table :selected_clients do |t|
      t.references :invoice, null: false, foreign_key: true
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
