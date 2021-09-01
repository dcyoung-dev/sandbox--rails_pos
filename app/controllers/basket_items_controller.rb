class BasketItemsController < ApplicationController
  def create
    basket = Basket.find(params.fetch(:basket_id))
    @basket_item = basket.basket_items.find_or_initialize_by(basket_item_params)

    if @basket_item.persisted?
      @basket_item.increase_quantity
    end

    respond_to do |format|
      if @basket_item.save
        format.turbo_stream
        format.html { redirect_to basket, notice: "Basket Item was successfully created." }
      else
        format.turbo_stream
        format.html { redirect_to product(@basket_item.product), status: :unprocessable_entity }
      end
    end
  end

  def increment
    @basket_item = BasketItem.find(params.fetch(:id))
    basket = @basket_item.basket

    respond_to do |format|
      if @basket_item.increase_quantity
        format.turbo_stream { render :create }
        format.html { redirect_to basket }
      else
        format.turbo_stream { render :create }
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def decrement
    @basket_item = BasketItem.find(params.fetch(:id))
    basket = @basket_item.basket

    respond_to do |format|
      if @basket_item.decrease_quantity
        format.turbo_stream { render :create }
        format.html { redirect_to basket }
      else
        format.turbo_stream { render :create }
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    basket_item = BasketItem.find(params.fetch(:id))
    basket = basket_item.basket
    product = basket_item.product

    respond_to do |format|
      if basket_item.destroy
        @basket_item = BasketItem.new(basket: basket, product: product)
        format.turbo_stream { render :create }
        format.html { redirect_to basket, notice: "Basket Item was destroyed." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def basket_item_params
    params.require(:basket_item).permit(:product_id)
  end
end