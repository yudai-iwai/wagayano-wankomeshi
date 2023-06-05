class CreatePostComments < ActiveRecord::Migration[6.1]
  def change
    create_table :post_comments do |t|

      t.integer :post_recipe_id, null: false
      t.integer :member_id, null: false
      t.text :comment, null: false
      t.timestamps null: false
    end
  end
end
