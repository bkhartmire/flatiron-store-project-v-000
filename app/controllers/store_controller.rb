class StoreController < ApplicationController
  def index
    @categories = Category.all
    @items = Item.all.select{|item| item.inventory > 0}
  end
end
