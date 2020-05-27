class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
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
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to :index, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
  def blog_params
    params.require(:blog).permit(:title, :content,:category_id)
  end
end
