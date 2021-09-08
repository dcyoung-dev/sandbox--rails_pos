class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :basket, null: false, foreign_key: true
      t.timestamps
    end
  end
end
