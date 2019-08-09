class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    if current_user
      @comment = current_user.comments.build(comment_params)

      authorize @comment

      if @comment.save
        ActionCable.server.broadcast(
          'blog_channel',
          comment: @comment,
          html: render(partial: 'comments/comment', locals: { comment: @comment })
        )

        head :no_content
      else
        redirect_back fallback_location: root_path, flash: { comment_errors: @comment.errors.full_messages }
      end
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:content, :blog_id)
    end
end
