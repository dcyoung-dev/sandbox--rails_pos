class MenusController < ApplicationController
  def show
    @basket = Basket.all.first || Basket.create
    @categories = Category.all
    @menu_items = MenuItem.all.ordered
  end
end