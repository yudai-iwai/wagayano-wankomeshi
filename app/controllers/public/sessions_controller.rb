# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :reject_member, only: [:create]
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  # ゲストログイン用のコード
  def new_guest
    member = Member.guest
    sign_in member
    redirect_to post_recipes_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  protected

  # 会員の論理削除のためのコード、退会後は同じアカウントは利用できない。
  def reject_member
    @member = Member.find_by(email: params[:member][:email])
    if @member
      if @member.valid_password?(params[:member][:password]) && (@member.is_deleted == true)
        redirect_to new_member_registration_path
      end
    end
  end

end
