class UsersController < ApplicationController
  include SessionsHelper
  skip_before_filter :require_login
  def show
    @user = User.find(params[:id])
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        flash[:success] = 'Signed up!'
        format.html { redirect_to @user }
      else
        flash[:danger] = 'There was a problem creating the user.'
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  # private: need to be at end of class
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
