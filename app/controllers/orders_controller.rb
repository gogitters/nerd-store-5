class OrdersController < ApplicationController
  def create
    carted_products = current_user.carted_products.where(status: "carted")

    order = Order.new(user_id: current_user.id)
    order.absolute_total(carted_products)
    if order.save
      flash[:success] = "Order created!"
      carted_products.update_all(status: "purchased", order_id: order.id)
      redirect_to "/orders/#{order.id + 234324}"
    else
      flash[:warning] = "Order not created because #{order.errors.full_message.join(", ")}"
      redirect_to "/carted_products"
    end
  end

  def show
    @order = Order.find_by(id: (params[:id].to_i - 234324))
    if current_user && @order.user == current_user
      render "show.html.erb"
    else
      flash[:warning] = "This is not your order you hacker!"
      redirect_to "/"
    end
  end
end
