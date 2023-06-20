class Admin::PostRecipesController < ApplicationController
  before_action :authenticate_admin!
  def index
    @post_recipes = PostRecipe.all.page(params[:page])
  end

  def show
    @post_recipe = PostRecipe.find(params[:id])
    @post_comments = @post_recipe.post_comments
  end

  def destroy
    post_recipe = PostRecipe.find(params[:id])
    post_recipe.destroy
    flash[:notice] = "レシピの削除が成功しました！"
    redirect_to admin_post_recipes_path
  end

  def edit
  end

  def update
  end
end
