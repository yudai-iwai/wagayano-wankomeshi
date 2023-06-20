class Public::PostRecipesController < ApplicationController
  before_action :authenticate_member!
  def new
    @post_recipe = PostRecipe.new
  end

  def create
    @post_recipe = PostRecipe.new(post_recipe_params)
    @post_recipe.member_id = current_member.id
    if @post_recipe.save
       flash[:notice] = "レシピを公開しました！"
       redirect_to post_recipe_path(@post_recipe.id)
    else
       render :new
    end
  end

  def index
    @post_recipes = params[:tag_id].present? ? Tag.find(params[:tag_id]).post_recipes.page(params[:page]) : PostRecipe.all.page(params[:page])
  end

  def show
    @post_recipe = PostRecipe.find(params[:id])
    @post_comment = PostComment.new
    @post_comments = @post_recipe.post_comments
  end

  def destroy
    post_recipe = PostRecipe.find(params[:id])
    post_recipe.destroy
    flash[:notice] = "レシピを削除しました！"
    redirect_to post_recipes_path
  end

  def edit
    @post_recipe = PostRecipe.find(params[:id])
  end

  def update
    post_recipe = PostRecipe.find(params[:id])
    post_recipe.update(post_recipe_params)
    flash[:notice] = "レシピを編集しました！"
    redirect_to post_recipe_path(post_recipe.id)
  end

  private

  def post_recipe_params
    params.require(:post_recipe).permit(:title, :introduction, :material_quantity, :recipe, :image, tag_ids: [])
  end
end
