class StoreController < ApplicationController
  def index
    @categories = Category.all
    @items = Item.all.collect{|item| item.inventory > 0}
  end
end
