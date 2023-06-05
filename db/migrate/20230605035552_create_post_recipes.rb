class CreatePostRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :post_recipes do |t|

      t.integer :member_id, null: false
      t.text :introduction, null: false
      t.text :material_quantity, null: false
      t.text :recipe, null: false
      t.timestamps null: false
    end
  end
end
