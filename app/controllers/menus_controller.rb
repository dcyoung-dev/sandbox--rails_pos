class MenusController < ApplicationController
  def show
    @basket = Basket.all.first || Basket.create
    @menu_items = MenuItem.all.ordered
  end
end