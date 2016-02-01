class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  private

  def render_403
    render file: 'public/403.html', status: 403
  end

  def render_404
    render file: 'public/404.html', status: 404
  end

  def current_user
    User.find_by id: session[:user_id] if session[:user_id]
  end

  def sign_in(user)
    session[:user_id] = user.id if user.present?
  end

  def sign_out
    session[:user_id] = nil
  end

  def check_if_admin
      render_403 unless params[:admin]
  end

end
