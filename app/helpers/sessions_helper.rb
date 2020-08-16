module SessionsHelper

  def require_login
  redirect_to :root_path, notice: "Please log in or sign up" unless current_user
  end

end
