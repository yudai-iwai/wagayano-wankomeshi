class Public::FavoritesController < ApplicationController
  before_action :authenticate_member!
  
  def create
    @post_recipe = PostRecipe.find(params[:post_recipe_id])
    favorite = current_member.favorites.new(post_recipe_id: @post_recipe.id)
    favorite.save
  end

  def destroy
    @post_recipe = PostRecipe.find(params[:post_recipe_id])
    favorite = current_member.favorites.find_by(post_recipe_id: @post_recipe.id)
    favorite.destroy
  end

end
