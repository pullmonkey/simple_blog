class CommentsController < ApplicationController
  def index
    @comments = Comment.find_all_by_post_id(params[:post_id]) 
  end
end
