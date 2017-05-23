class ProductsController < ApplicationController
  def index
    if session[:visit_count]
      session[:visit_count] += 1
    else
      session[:visit_count] = 1
    end
    @visit_count = session[:visit_count]
    if current_user
      @message = "#{current_user.name} is really cool."
    end
    if params[:sort] && params[:sort_order]
      @products = Product.order(params[:sort] => params[:sort_order])
    elsif params[:discount]
      @products = Product.where("price < ?", 10)
    elsif params[:search]
      @products = Product.where("name ILIKE ?", "%#{params[:search]}%")
    else
      @products = Product.all
    end
    render "index.html.erb"
  end

  def new
    @suppliers = Supplier.all
    render "new.html.erb"
  end

  def create
    @product = Product.create(
      name: params[:name],
      description: params[:description],
      price: params[:price],
      supplier_id: params[:supplier_id]
    )
    flash[:success] = "Product Created"
    redirect_to "/products/#{@product.id}"
  end

  def show
    if params[:id] == "random"
      @product = Product.all.sample
    else
      @product = Product.find_by(id: params[:id])
    end
    render "show.html.erb"
  end

  def edit
    @product = Product.find_by(id: params[:id])
    render "edit.html.erb"
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.update(
      name: params[:name],
      description: params[:description],
      price: params[:price],
      supplier_id: params[:supplier_id]
    )
    flash[:success] = "Product Updated"
    redirect_to "/products/#{@product.id}"
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    flash[:warning] = "Product Destroyed"
    redirect_to "/"
  end

end

