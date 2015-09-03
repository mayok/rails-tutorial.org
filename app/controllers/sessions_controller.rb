class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    # has_secure_password が authenticate method を用意してくれてる
    # 正しい password であれば、User を返す
    if user && user.authenticate(params[:session][:password])
      # Login
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy

  end
end
