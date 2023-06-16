class Admin::PostCommentsController < ApplicationController
  before_action :authenticate_admin!
  def destroy
    PostComment.find(params[:id]).destroy
    flash[:notice] = "コメントの削除が成功しました！"
    redirect_to admin_post_recipe_path(params[:post_recipe_id])
  end
end
