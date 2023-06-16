class Admin::PostCommentsController < ApplicationController
  before_action :authenticate_admin!
  
  def destroy
    @post_recipe = PostRecipe.find(params[:post_recipe_id])
    PostComment.find(params[:id]).destroy
  end
end
