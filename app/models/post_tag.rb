class PostTag < ApplicationRecord
  belongs_to :post_recipe
  belongs_to :tag
end
