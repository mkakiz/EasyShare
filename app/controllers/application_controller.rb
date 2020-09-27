class ApplicationController < ActionController::Base
  before_action :set_current_user

  def set_current_user
    # @current_user = User.find_by(id: session[:user_id])
    @current_user = User.find_by(id: session[:user_id]) if session[:user_id].present?
  end

  def authenticate_user
    if @current_user == nil
      flash[:notice] = "Please Login"
      redirect_to("/login")
    end
  end

  def forbid_login_user
    if @current_user
      flash[:notice] = "Already LoggedIn"
      redirect_to("/posts/index")
    end
  end

end
