class CreateMenuItems < ActiveRecord::Migration[6.1]
  def change
    create_table :menu_items do |t|
      t.references :product, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.integer :position, default: 0

      t.timestamps
    end
  end
end
