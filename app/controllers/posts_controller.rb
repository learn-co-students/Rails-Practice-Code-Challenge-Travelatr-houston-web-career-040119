class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.valid?
      @post.save
      redirect_to @post
    else
      flash[:error] = @post.errors.full_messages
      render :new
    end
  end

  def edit
    @post = current_post
  end

  def update
    @post_update = Post.new(post_params)
    if @post_update.valid?
      current_post.update(post_params)
      redirect_to current_post
    else
      flash[:error] = post_update.errors.full_messages
      render :edit
    end
  end

  def show
    @post = current_post
  end

  def like
    @post = current_post
    @post[:likes] = @post[:likes] + 1
    @post.save
    redirect_to @post
  end

  private

  def post_params
    params.require(:post).permit(:title,:content,:blogger_id,:destination_id,:likes)
  end

  def current_post
    Post.all.find(params[:id])
  end

end
