class BloggersController < ApplicationController

  def index
    @bloggers = Blogger.all
  end

  def show
    current_blogger
  end

  private

  def current_blogger
    @blogger = Blogger.all.find(params[:id])
  end

end
