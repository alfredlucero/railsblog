class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    # Create and save the comment to link to the article
    @comment = @article.comments.create(comment_params)
    # After successfully adding the comment, we return them back to the original article
    redirect_to article_path(@article)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :status)
    end
end
