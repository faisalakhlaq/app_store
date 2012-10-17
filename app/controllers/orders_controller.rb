class OrdersController < ApplicationController
  def new
    @cart = current_cart
    if @cart.line_items.empty?
      flash[:failure] = "Your cart is empty";
      redirect_to root_url
      return
    end
    @order = Order.new

  end

  def create
    @order = Order.new(params[:order])
    @order.add_line_items_from_cart(current_cart)
      if @order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        flash[:thanks] = "Thank you for your order."
        redirect_to root_url
      else
        render :action => "new"
      end
  end
end


