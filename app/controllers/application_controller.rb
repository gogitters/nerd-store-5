class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :all_categories
  # helper_method :cart_count
  before_action :cart_count

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def cart_count
    if current_user
      @cart_count ||= current_user.carted_products.where(status: "carted").count
    else
      @cart_count = 0
    end
  end

  def authenticate_admin!
    unless current_user && current_user.admin
      flash[:warning] = "y u hacker"
      redirect_to "/login" 
    end
  end

  def authenticate_user!
    redirect_to "/login" unless current_user
  end

  def all_categories
    @all_categories ||= Category.all
  end
end
