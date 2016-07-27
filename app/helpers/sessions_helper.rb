module SessionsHelper

  # Logs in
  def log_in(user)
    session[:user_id] = user.id
  end

  # Defines current_user
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(:remember, cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  def current_user?(user)
    user == current_user || admin_user?(user)
  end

  # Checks if the user is logged in
  def logged_in?
    !current_user.nil?
  end

  def admin_user?(user)
    if user
      user.entitie == '0'
    end
  end

  # Logs out the current user
  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end

  # Remembers user for next session
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  def redirect_back_or(default)
    redirect_to(session[:forwading_url] || default)
    session.delete(:forwading_url)
  end

  def store_location
    session[:forwading_url] = request.original_url if request.get?
  end
end
