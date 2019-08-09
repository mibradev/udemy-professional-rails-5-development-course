class BlogsController < ApplicationController
  layout 'blog'
  before_action :set_blog, only: [:edit, :update, :destroy, :toggle_status]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @blogs = policy_scope(Blog).order(created_at: :desc).page(params[:page]).per(5)
    authorize @blogs
    @page[:title] = 'Blog'
  end

  def show
    @blog = policy_scope(Blog).friendly.find(params[:id])
    @comments = @blog.comments.includes(:user).order(created_at: :desc).page(params[:comment_page]).per(10)
    @comment = Comment.new

    authorize @blog

    @page[:title] = @blog.title
  end

  def new
    @blog = Blog.new
    authorize @blog
  end

  def edit
    authorize @blog
  end

  def create
    @blog = Blog.new(blog_params)
    authorize @blog

    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'Your post is now live.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    authorize @blog

    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    authorize @blog
    @blog.destroy

    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Post was removed.' }
    end
  end

  def toggle_status
    authorize @blog

    if @blog.draft?
      @blog.published!
    elsif @blog.published?
      @blog.draft!
    end

    redirect_to blogs_url, notice: 'Post status has been updated.'
  end

  private
    def set_blog
      @blog = Blog.friendly.find(params[:id])
    end

    def blog_params
      params.require(:blog).permit(:title, :body, :status, :topic_id)
    end
end
