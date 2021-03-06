class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    render :show
  end

  def new
    @user = User.new
    @hide_header_signup = true
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      mail = UserMailer.welcome_email(@user)
      mail.deliver_now
      log_in!(@user)
      redirect_to bands_url
    else
      flash.now[:errors] = @user.errors.full_messages
      @hide_header_signup = true
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
