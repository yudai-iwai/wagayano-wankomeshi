class Public::MembersController < ApplicationController
  def index
  end

  def show
  end
  
  def my_page
    @member = current_member
    @post_recipes = current_member.post_recipes
  end
  
  def edit
  end
  
  def update
  end
  
  def quit
  end
  
  def out
  end
end
