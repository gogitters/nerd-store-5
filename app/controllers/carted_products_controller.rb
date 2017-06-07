class CartedProductsController < ApplicationController
  before_action :authenticate_user!

  def index
    @carted_products = current_user.carted_products.where(status: "carted")
    # @carted_products = CartedProduct.where(status: "carted", user_id: current_user.id)
    render "index.html.erb"
  end

  def create
    carted_product = CartedProduct.new(user_id: current_user.id, product_id: params[:product_id], quantity: params[:quantity], status: "carted")
    if carted_product.save
      flash[:success] = "Item added to cart"
      redirect_to "/carted_products"
    else
      flash[:warning] = "Item not added to cart. #{carted_product.errors.full_messages.join(", ")}"
      redirect_to "/products/#{params[:product_id]}"
    end
  end

  def destroy
    carted_product = CartedProduct.find_by(id: params[:id])
    carted_product.update(status: "removed")
    redirect_to "/carted_products"
  end
end
