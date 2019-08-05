class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    if current_user
      @comment = current_user.comments.build(comment_params)

      authorize @comment

      if Blog.exists?(@comment.blog_id) && @comment.save
        ActionCable.server.broadcast(
          'blog_channel',
          comment: @comment,
          html: render(partial: 'comments/comment', locals: { comment: @comment })
        )
      end
    end

    head :no_content
  end

  private
    def comment_params
      params.require(:comment).permit(:content, :blog_id)
    end
end
