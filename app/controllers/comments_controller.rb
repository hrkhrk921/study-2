class CommentsController < ApplicationController
	before_action :authenticate_user!

  def create
    book = Book.find(params[:book_id])
    @comment = book.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:notice] = "コメントしました"
      redirect_back(fallback_location: root_path)
    else
      flash[:notice] = "コメントできませんでした"
      redirect_back(fallback_location: root_path)
    end
  end
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = '投稿へのコメントを削除しました。'
    redirect_back(fallback_location: root_path)
  end


  private

    def comment_params
      params.require(:comment).permit(:body)
    end
end
