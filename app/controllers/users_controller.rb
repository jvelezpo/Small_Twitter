class UsersController < ApplicationController
  def new
  	@title = "Sing up"
  	@user = User.new
  end
  
  def show
  	@user = User.find(params[:id])
  	@title = @user.name
  end
  	
  def create
  	@user = User.new(params[:user])
  	if @user.save
  		flash[:success] = "Wellcome to the best WebApp ever! " + @user.name
  		redirect_to user_path(@user)
  	else
  		@title = "Sing up"
  		render 'new'
  	end	
  end

end
