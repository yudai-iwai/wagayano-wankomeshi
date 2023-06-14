class Admin::PostRecipesController < ApplicationController
  def index
    @post_recipes = PostRecipe.all.page(params[:page])
  end

  def show
    @post_recipe = PostRecipe.find(params[:id])
  end
  
  def destroy
    post_recipe = PostRecipe.find(params[:id])
    post_recipe.destroy
    redirect_to admin_post_recipes_path
  end
  
  def edit
  end
  
  def update
  end
end
