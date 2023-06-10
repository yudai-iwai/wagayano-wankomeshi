class Admin::PostCommentsController < ApplicationController
  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to admin_post_recipe_path(params[:post_recipe_id])
  end
end
