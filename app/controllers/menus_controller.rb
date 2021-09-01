class MenusController < ApplicationController
  def show
    @basket = Basket.all.first || Basket.create
    @default_category = Category.order(:id).first
  end
end
