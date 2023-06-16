class Public::PostCommentsController < ApplicationController
  before_action :authenticate_member!
  
  def create
    post_recipe = PostRecipe.find(params[:post_recipe_id])
    comment = current_member.post_comments.new(post_comment_params)
    comment.post_recipe_id = post_recipe.id
    comment.save
    flash[:notice] = "コメントの送信がしました！"
    @post_recipe = PostRecipe.find(params[:post_recipe_id])
    @post_comment = PostComment.new
  end
  
  def destroy
    @post_recipe = PostRecipe.find(params[:post_recipe_id])
    @post_comment = PostComment.find(params[:id])
    @post_comment.destroy
    flash[:notice] = "コメントの削除が成功しました！"
    @post_comment = PostComment.new
  end
  
  private
  
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
  
end
