class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|

      t.integer :post_recipe_id, null: false
      t.integer :member_id, null: false
      t.timestamps null: false
    end
  end
end
