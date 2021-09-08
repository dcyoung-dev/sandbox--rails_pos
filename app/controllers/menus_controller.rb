class MenusController < ApplicationController
  def show
    @basket = Basket.incomplete.first || Basket.create
    @default_category = Category.order(:id).first
  end
end
