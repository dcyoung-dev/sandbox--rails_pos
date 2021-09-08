class OrdersController < ApplicationController
  def create
    basket = Basket.incomplete.find(params.fetch(:basket_id))
    order = basket.build_order

    respond_to do |format|
      if order.save
        format.html { redirect_to menu_path, notice: "Order was successfully created." }
      else
        format.html { redirect_to basket, status: :unprocessable_entity }
      end

      @completed_basket = basket
      @basket = Basket.create
      format.turbo_stream
    end
  end
end