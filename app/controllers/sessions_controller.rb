class SessionsController < ApplicationController
  def new
  end

  def create
    # Instance variable にすると、test 内で assigns(:user) のようにしてアクセス出来る
    @user = User.find_by(email: params[:session][:email].downcase)
    # has_secure_password が authenticate method を用意してくれてる
    # 正しい password であれば、User を返す
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
      redirect_back_or @user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
