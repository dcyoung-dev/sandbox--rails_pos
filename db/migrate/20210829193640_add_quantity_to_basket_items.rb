class AddQuantityToBasketItems < ActiveRecord::Migration[6.1]
  def change
    add_column :basket_items, :quantity, :integer, default: 1
  end
end
