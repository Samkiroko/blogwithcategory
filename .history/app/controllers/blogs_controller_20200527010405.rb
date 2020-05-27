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
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
    redirect_to @blog
    else
      render :edit
    end
  end

  def destroy
    @blog = Blog.find(params[:id])


    @blog.destroy
    redirect_to :action => :index
    redirect_to :action => :index, :notice => "Your patient has been deleted"
  end


  private
  def blog_params
    params.require(:blog).permit(:title, :content)
  end
end
