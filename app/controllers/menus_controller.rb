class MenusController < ApplicationController
  def show
    @basket = Basket.first || Basket.create
    @default_category = Category.order(:id).first
  end
end
