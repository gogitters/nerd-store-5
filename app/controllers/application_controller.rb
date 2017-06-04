class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :all_categories

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def authenticate_admin!
    unless current_user && current_user.admin
      flash[:warning] = "y u hacker"
      redirect_to "/login" 
    end
  end

  def all_categories
    @all_categories ||= Category.all
  end
end
