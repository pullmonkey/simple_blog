class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    redirect_to :action => 'index' unless request.post?
    if @post = Post.create(params[:post])
      flash[:notice] = "Post Created"
      redirect_to :action => 'index'
    else
      flash[:error] = "Post Not Created"
      render :action => 'new'
    end
  end
end
