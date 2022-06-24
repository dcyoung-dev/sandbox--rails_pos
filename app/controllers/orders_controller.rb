require "ice_cube"

class OrdersController < ApplicationController
  def new
    basket = Basket.incomplete.find(params.fetch(:basket_id))

    working_schedule = IceCube::Schedule.new(Date.today)
    working_schedule.add_recurrence_rule(IceCube::Rule.minutely(15))

    available_schedule = IceCube::Schedule.new(Date.today)
    available_schedule.add_recurrence_rule(IceCube::Rule.minutely(15))
    Order.all.pluck(:booked_at).compact.each do |exception_time|
      available_schedule.add_exception_time(exception_time)
    end

    working_slots = working_schedule.occurrences_between(Time.parse("9am"), Time.parse("6pm") - 1.second)
    slots = working_slots.map do |working_slot|
      [working_slot, available_schedule.occurs_at?(working_slot)]
    end

    slots = Hash[*slots.flatten]

    render locals: {basket: basket, slots: slots}
  end

  def create
    basket = Basket.incomplete.find(params.fetch(:basket_id))
    order = basket.build_order(order_params)

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

  private

  def order_params
    params.require(:order).permit(:booked_at)
  end
end
