class UsersController < ApplicationController 
  
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_path(@user),  notice: "#{@user.name} was successfully updated." }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity } 
      end
    end
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
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :date_of_birth, :instagram_username, :flickr_username)
  end
end
