class PostComment < ApplicationRecord
  belongs_to :member
  belongs_to :post_recipe
end
