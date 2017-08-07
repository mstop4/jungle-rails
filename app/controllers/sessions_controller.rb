class SessionsController < ApplicationController

  def new
  end

  def create
    if user = authenticate_with_credentials(params[:email], params[:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

  private

  def authenticate_with_credentials(email, password)
    if user = User.find_by_email(email)
      return user.authenticate(password)
    else
      return nil
    end
  end

end
