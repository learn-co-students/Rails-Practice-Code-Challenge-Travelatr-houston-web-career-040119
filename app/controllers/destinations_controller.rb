class DestinationsController < ApplicationController
  def show
    @dest = Destination.find(params[:id])
    @recent_posts = @dest.posts.reload.order("created_at DESC").limit(5)
    @feat_posts = @dest.posts.reload.order("likes DESC").limit(1)
    @feat_post = nil
    if @feat_posts.length > 0
      @feat_post = @feat_posts[0]
    end
    bloggers = @dest.bloggers.reload.uniq
    if bloggers.count > 0
      @avg_age = bloggers.map { |blogger| blogger.age }.sum / bloggers.count
    end
  end
end
