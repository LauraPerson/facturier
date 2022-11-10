class AddTotalToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :total, :integer
  end
end
