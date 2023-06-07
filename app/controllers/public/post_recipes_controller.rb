class Public::PostRecipesController < ApplicationController
  def new
    @post_recipe = PostRecipe.new
  end

  def create
    @post_recipe = PostRecipe.new(post_recipe_params)
    @post_recipe.member_id = current_member.id
    @post_recipe.save
    redirect_to post_recipe_path(@post_recipe.id)
  end

  def index
    @post_recipes = PostRecipe.all
  end

  def show
    @post_recipe = PostRecipe.find(params[:id])
  end

  def destroy
    post_recipe = PostRecipe.find(params[:id])
    post_recipe.destroy
    redirect_to post_recipes_path
  end
  
  def edit
    @post_recipe = PostRecipe.find(params[:id])
  end
  
  def update
    post_recipe = PostRecipe.find(params[:id])
    post_recipe.update(post_recipe_params)
    redirect_to post_recipe_path(post_recipe.id)
  end

  private

  def post_recipe_params
    params.require(:post_recipe).permit(:title, :introduction, :material_quantity, :recipe, :image)
  end
end
