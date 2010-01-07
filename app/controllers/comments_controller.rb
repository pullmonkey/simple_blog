class CommentsController < ApplicationController
  unloadable
  self.append_view_path(File.join(File.dirname(__FILE__), '..', 'views'))  
  helper :all
  before_filter :find_post
  before_filter :admin_required, :only => [:edit, :destroy, :update]

  def index
    @comments = @post.comments
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comments }
    end
  end
  
  # # GET /comments/1
  # # GET /comments/1.xml
  # def show
  #   @comment = Post.find(params[:id])
  # 
  #   respond_to do |format|
  #     format.html # show.html.erb
  #     format.xml  { render :xml => @comment }
  #   end
  # end
  
  # GET /comments/new
  # GET /comments/new.xml
  def new
    @comment = @post.comments.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @comment }
    end
  end
  
  # GET /comments/1/edit
  def edit
    @comment = @post.comments.find(params[:id])
  end
  
  # POST /comments
  # POST /comments.xml
  def create
    @comment = @post.comments.build(params[:comment])
  
    respond_to do |format|
      if @comment.save
        flash[:notice] = 'Post was successfully created.'
        format.html { redirect_to(posts_url) }
        format.xml  { render :xml => @comment, :status => :created, :location => @comment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # # PUT /comments/1
  # # PUT /comments/1.xml
  # def update
  #   @comment = Post.find(params[:id])
  # 
  #   respond_to do |format|
  #     if @comment.update_attributes(params[:comment])
  #       flash[:notice] = 'Post was successfully updated.'
  #       format.html { redirect_to(@comment) }
  #       format.xml  { head :ok }
  #     else
  #       format.html { render :action => "edit" }
  #       format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
  #     end
  #   end
  # end
  
  # DELETE /comments/1
  # DELETE /comments/1.xml
  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
  
    respond_to do |format|
      format.html { redirect_to(posts_url) }
      format.xml  { head :ok }
    end
  end

  ##################################################
  # Private methods
  ##################################################
  
  private
  
  def find_post
    @post = Post.find(params[:post_id])
  end
end