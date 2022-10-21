class AddSirenToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :siren, :integer
  end
end
