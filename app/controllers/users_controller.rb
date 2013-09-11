class UsersController < ApplicationController 
  
  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		redirect_to products_url, :notice => "Signed up!"
  	else
  		render "new"
  	end
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :date_of_birth)
  end
end
