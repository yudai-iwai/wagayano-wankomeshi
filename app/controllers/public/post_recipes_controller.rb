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
    @post_recipes = params[:tag_id].present? ? Tag.find(params[:tag_id]).post_recipes.page(params[:page]) : PostRecipe.all.page(params[:page])
  end

  def show
    @post_recipe = PostRecipe.find(params[:id])
    @post_comment = PostComment.new
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
    params.require(:post_recipe).permit(:title, :introduction, :material_quantity, :recipe, :image, tag_ids: [])
  end
end
