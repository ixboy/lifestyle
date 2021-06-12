class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(name: params[:name])
    if @user
      session[:user_id] = @user.id
      redirect_to root_path notice: "Logged in successfully as: #{@user.name}"
    else
      flash[:alert] = 'Invalid Name'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged out'
  end
end
