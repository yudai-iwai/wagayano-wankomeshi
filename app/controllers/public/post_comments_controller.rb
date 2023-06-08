class Public::PostCommentsController < ApplicationController
  def create
    post_recipe = PostRecipe.find(params[:post_recipe_id])
    comment = current_member.post_comments.new(post_comment_params)
    comment.post_recipe_id = post_recipe.id
    comment.save
    redirect_to post_recipe_path(post_recipe)
  end
  
  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to post_recipe_path(params[:post_recipe_id])
  end
  
  private
  
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
  
end
