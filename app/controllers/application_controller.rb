class ApplicationController < ActionController::Base

  def set_user_session
    if cookies[:user_id]
      @current_user = cookies.signed[:user_id]
    else
      @current_user = SecureRandom.uuid
      cookies.signed[:user_id] = {value: @current_user, expires: 1.year.from_now}
    end
  end
end
