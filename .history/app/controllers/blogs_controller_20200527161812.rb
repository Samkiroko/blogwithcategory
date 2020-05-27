class BlogsController < ApplicationController
  def index
    @category = Category.all
    @blog = Blog.all

    cate = params[:cate]

    if !cate.nil?
      @blogs = Blog.where(:category_id => cate)
    else
      @blog = Blog.all
    end
  end
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
      format.html { redirect_to blog_path, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private

  def set_blog
      @blog = Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:title, :content,:category_id)
  end
end
