class CommentsController < ApplicationController

  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    @post = Post.find(params[:post_id])
    respond_to do |format|
      format.js
    end
  end

  def modify
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.update_column(:body, params[:comment][:body])
    @comment.reload
    respond_to do |format|
      format.js
    end
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params[:comment])
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_path(@post), notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to manage_comments_users_path }
      format.json { head :no_content }
    end
  end
end
