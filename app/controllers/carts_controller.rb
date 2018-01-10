class CartsController < ApplicationController
  def show
    @current_cart = Cart.find_by(id: params[:id])
  end

  def checkout
    @current_cart = Cart.find_by(id: params[:id])
    count = 0
    @current_cart.items.each do |item|
      item.inventory -= @current_cart.line_items[count].quantity
      item.save
      count += 1
    end

    @current_cart.update(status: "Submitted")
    current_user.update(current_cart: nil)
    redirect_to cart_path(@current_cart)
  end
end
