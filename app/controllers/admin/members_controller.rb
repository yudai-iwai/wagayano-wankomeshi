class Admin::MembersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @members = Member.all.page(params[:page])
  end

  def show
    @member = Member.find(params[:id])
    @post_recipes = @member.post_recipes.page(params[:page])
  end

  def out
    @member = Member.find(params[:id])
    @member.update(is_deleted: true)
    flash[:notice] = "退会の処理が成功しました！"
    redirect_to admin_members_path
  end

  def resume
    @member = Member.find(params[:id])
    @member.update(is_deleted: false)
    flash[:notice] = "利用再開の処理が成功しました！"
    redirect_to admin_members_path
  end
end
