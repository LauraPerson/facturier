class AddBicToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :bic, :string
  end
end
