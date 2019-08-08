class TopicsController < ApplicationController
  layout 'blog'

  def index
    @topics = Topic.all
    @page[:title] = 'Blog Topics'
  end

  def show
    @topic = Topic.find(params[:id])
    @blogs = policy_scope(@topic.blogs).order(created_at: :desc).page(params[:page]).per(5)
    @page[:title] = "#{@topic.title} Blog Posts"
  end
end
