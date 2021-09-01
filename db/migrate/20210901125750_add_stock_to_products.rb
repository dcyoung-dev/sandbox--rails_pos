class AddStockToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :stock_count, :integer, default: 0
  end
end
