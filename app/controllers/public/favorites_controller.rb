class Public::FavoritesController < ApplicationController
  def create
    post_recipe = PostRecipe.find(params[:post_recipe_id])
    favorite = current_member.favorites.new(post_recipe_id: post_recipe.id)
    favorite.save
    redirect_to request.referer
  end

  def destroy
    post_recipe = PostRecipe.find(params[:post_recipe_id])
    favorite = current_member.favorites.find_by(post_recipe_id: post_recipe.id)
    favorite.destroy
    redirect_to request.referer
  end

end
