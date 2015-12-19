helpers do

  def current_user
    @current_user ||= User.where(id: session[:id]).first if session[:id]
  end

  def logged_in
    current_user.nil? == false
  end

end
