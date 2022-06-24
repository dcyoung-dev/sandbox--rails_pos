class AddBookedAtToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :booked_at, :datetime
  end
end
