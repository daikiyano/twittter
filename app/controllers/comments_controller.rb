class CommentsController < ApplicationController

  def create
    @tweeet = Tweeet.find(params[:tweeet_id])
      @comment = @tweeet.comments.build(comment_params)
      @comment.user_id = current_user.id
      if @comment.save
        redirect_back(fallback_location: root_path)
      else
        redirect_back(fallback_location: root_path)
      end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      redirect_to root_path
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:body,:user_id,:tweeet_id)

  end

end
