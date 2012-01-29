class MicropostsController < ApplicationController
  before_filter :authenticate
  before_filter :authorized_user, :only => :destroy

  def create
    @micropost = current_user.microposts.build(params[:micropost])
    if @micropost.save
      flash[:success] = "Comentario Creado!!!!"
      redirect_to root_path
    else
      @feed_items = current_user.feed
      render 'pages/home'
    end

  end
  def destroy
    @micropost.destroy
    flash[:success] = "Comentario borrado!"
    redirect_to root_path
  end

  private

  def authorized_user
    @micropost = Micropost.find(params[:id])
    redirect_to root_path unless current_user?(@micropost.user)
  end

end































