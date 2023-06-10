class Admin::MembersController < ApplicationController
  def index
    @members = Member.all
  end

  def show
    @member = Member.find(params[:id])
    @post_recipes = @member.post_recipes
  end

  def out
    @member = Member.find(params[:id])
    @member.update(is_deleted: true)
    redirect_to admin_members_path
  end

  def resume
    @member = Member.find(params[:id])
    @member.update(is_deleted: false)
    redirect_to admin_members_path
  end
end
