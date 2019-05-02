class BloggersController < ApplicationController
  def new
    @blogger = Blogger.new
  end

  def create
    @blogger = Blogger.new(blogger_params)
    if @blogger.valid?
      @blogger.save
      redirect_to blogger_path(@blogger)
    else
      render :new
    end
  end

  def show
    @blogger = Blogger.find(params[:id])
    @posts = @blogger.posts.reload.uniq
    @total_likes = @posts.map { |post| post.likes }.sum
    @feat_post = @posts.max_by { |post| post.likes }
    @top_destinations = @blogger.destinations.reload.uniq \
      .sort_by { |dest| dest.posts.reload.where(blogger:@blogger).uniq } \
      .slice(0,5)
  end

  def index
    @bloggers = Blogger.all
    @set_dont_render_index_link = true
  end

  private

  def blogger_params
    params.require(:blogger).permit(:name,:age,:bio)
  end
end