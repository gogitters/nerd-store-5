class OrdersController < ApplicationController
  def create
    order = Order.new(quantity: params[:quantity], user_id: current_user.id, product_id: params[:product_id])
    # order.subtotal = product.price * params[:quantity].to_i
    # order.tax = product.tax * params[:quantity].to_i
    # order.total = order.subtotal + order.tax

    # order.calculate_subtotal
    # order.calculate_tax
    # order.calculate_total
    order.absolute_total
    order.save
    redirect_to "/orders/#{order.id}"
  end

  def show
    @order = Order.find_by(id: params[:id])
    if current_user && @order.user == current_user
      render "show.html.erb"
    else
      flash[:warning] = "This is not your order you hacker!"
      redirect_to "/"
    end
  end
end
