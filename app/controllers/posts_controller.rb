class PostsController < ApplicationController
  def new
    @post = Post.new
    prep_form
  end

  def create
    @post = Post.new(post_params)
    prep_form

    if @post.valid?
      if !@post.likes
        @post.likes = 0
      end
      @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    prep_form
  end

  def update
    @post = Post.find(params[:id])
    prep_form

    @post.assign_attributes(post_params)
    if @post.valid?
      @post.save
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def show
    @post = Post.find(params[:id])
    @blogger = @post.blogger
    @dest = @post.destination
  end

  def like # HTTP: :post
    @post = Post.find(params[:id])
    @post.likes += 1
    @post.save
    redirect_to post_path(@post)
  end

  private

  def post_params
    params.require(:post).permit(:title,:content,:blogger_id,:destination_id)
  end

  def prep_form
    @all_bloggers = Blogger.all
    @all_dests = Destination.all
    @blogger = @post.blogger || Blogger.all.first
    @dest = @post.destination || Destination.all.first
  end
end