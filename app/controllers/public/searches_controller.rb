class Public::SearchesController < ApplicationController
  def search
    @range = params[:range]
    if @range == "犬種"
      @members = Member.looks(params[:search], params[:word])
    else
      @post_recipes = PostRecipe.looks(params[:search], params[:word])
    end
  end
end
