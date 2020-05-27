class BlogsController < ApplicationController
  def index
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def new
    @blog =Blog.new
  end

  def create
    @blog = Blog.create(blog_params)

    if @blog.save
      redirect_to @blog
    else
      render :new
    end
  end

  def edit
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :content)
  end
end
