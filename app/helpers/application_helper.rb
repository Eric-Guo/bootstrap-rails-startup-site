module ApplicationHelper
  def signed_in_user
    store_location
    redirect_to new_user_session_path, notice: 'Please sign in.' unless signed_in?
  end

  def store_location
    session[:return_to] = request.fullpath if request.get?
  end
end
