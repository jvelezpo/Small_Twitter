class UsersController < ApplicationController
  before_filter :authenticate, :only => [:index, :edit, :update, :destroy]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user, :only => :destroy

  def index
  	@users = User.all
  	@title = "All users"	
  end
  
  def new
  	@title = "Sign up"
  	@user = User.new
  end
  
  def show
  	@user = User.find(params[:id])
  	@title = @user.name
  end
  	
  def create
  	@user = User.new(params[:user])
  	if @user.save
  		sign_in @user
  		flash[:success] = "Wellcome to the best WebApp ever! " + @user.name
  		redirect_to user_path(@user)
  	else
  		@title = "Sign up"
  		render 'new'
  	end	
  end
  
  def edit
  	@user = User.find(params[:id])
  	@title = "Edit User"	
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update_attributes(params[:user])
  		flash[:success] = "Cambiaste todo, que mierdero! " + @user.name
  		redirect_to @user
  	else
  		@title = "Edit User"	
  		render 'edit'
  	end
  end
  
  def destroy
  	@user.destroy
  	flash[:success] = "User destroyed."
  	redirect_to users_path
  end
  
  private
  
  def authenticate
  	deny_access unless signed_in?
  end

  def correct_user
  	@user = User.find(params[:id])
  	redirect_to(current_user) unless current_user?(@user)
  end  
  
  def admin_user
  	@user = User.find(params[:id])
  	flash[:error] = "No te puedes borrar a ti mismo"
  	redirect_to(users_path) if (!current_user.admin? || current_user?(@user))
  end
end















