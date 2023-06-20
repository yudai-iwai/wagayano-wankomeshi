class Public::PostCommentsController < ApplicationController
  before_action :authenticate_member!
  
  def create
    post_recipe = PostRecipe.find(params[:post_recipe_id])
    comment = current_member.post_comments.new(post_comment_params)
    comment.post_recipe_id = post_recipe.id
    comment.save
    @post_recipe = PostRecipe.find(params[:post_recipe_id])
    @post_comment = PostComment.new
    @post_comments = @post_recipe.post_comments
  end
  
  def destroy
    @post_recipe = PostRecipe.find(params[:post_recipe_id])
    @post_comment = PostComment.find(params[:id])
    @post_comment.destroy
    @post_comment = PostComment.new
    @post_comments = @post_recipe.post_comments
  end
  
  private
  
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
  
end
