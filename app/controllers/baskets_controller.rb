class BasketsController < ApplicationController
  def show
    @basket = Basket.eager_load(
      basket_items: [
        :product
      ]
    ).find(params.fetch(:id))
  end
end
