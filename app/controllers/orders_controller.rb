class OrdersController < ApplicationController
  def create
    basket = Basket.incomplete.find(params.fetch(:basket_id))
    order = basket.build_order

    respond_to do |format|
      @completed_basket = basket
      if basket.basket_items.any? && order.save
        @basket = Basket.create
        format.html { redirect_to menu_path, notice: "Order was successfully created." }
      else
        @basket = basket
        format.html { redirect_to basket, status: :unprocessable_entity }
      end

      format.turbo_stream
    end
  end
end