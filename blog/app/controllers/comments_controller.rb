class CommentsController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "testing", only: :destroy

  def create
    @article = Article.find(params[:article_id])
    # Create and save the comment to link to the article
    @comment = @article.comments.create(comment_params)
    # After successfully adding the comment, we return them back to the original article
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article), status: 303
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :status)
    end
end
