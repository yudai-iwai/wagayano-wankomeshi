class Public::MembersController < ApplicationController
  def index
    @members = Member.all
  end

  def show
    @member = Member.find(params[:id])
    @post_recipes = @member.post_recipes
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
  end

  private

  def member_params
    params.require(:member).permit(:name, :email, :dog_name, :dog_breed, :dog_age, :dog_gender, :image)
  end

end
