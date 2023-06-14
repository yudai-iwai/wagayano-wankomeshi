class Public::MembersController < ApplicationController
  before_action :set_member, only: [:followings, :followers]
  
  def index
    @members = Member.all.page(params[:page])
  end

  def show
    @member = Member.find(params[:id])
    @post_recipes = @member.post_recipes.page(params[:page])
  end

  def my_page
    @member = current_member
    @post_recipes = current_member.post_recipes
  end

  def edit
    @member = current_member
  end

  def update
    @member = current_member
    @member.update(member_params)
    redirect_to my_page_members_path
  end

  def quit
  end

  def out
    @member = current_member
    @member.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  def favorites
    @member = Member.find(params[:id])
    favorites = Favorite.where(member_id: @member.id).pluck(:post_recipe_id)
    @favorite_post_recipes = PostRecipe.find(favorites)
  end
  
  def followings
    @members = @member.followings
  end

  def followers
    @members = @member.followers
  end
  
  private

  def member_params
    params.require(:member).permit(:name, :email, :dog_name, :dog_breed, :dog_age, :dog_gender, :image)
  end

  def set_member
    @member = Member.find(params[:id])
  end

end
